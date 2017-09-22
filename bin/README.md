# Scripts

## spark-cli

A simple wrapper around the `aws` cli tool, which this assumes is set up correctly already. The use case here is for development clusters, where you may create a cluster once, store data to HDFS, go home, play around some more, and want a simple tool for coordinating.

The commands are simply:
* `spark-cli start`
* `spark-cli ssh`
* `spark-cli ssh-tunnel`
* `spark-cli stop`

Where start will create a `~/.spark-session.lock` file locally with your cluster id. You can use this for subsequent `ssh` and `stop` calls, which will look for the file, read the cluster id, and act appropriately.

Everything is configurable via environment variables (and you'll get barked at if they're not set). See spark.sh (which goes in your `.bash_includes` dir) for which (or get yelled at).

To view the Spark shell application UI, first set up foxyproxy according to the instructions provided by the EMR web console.

<img width="1388" alt="screenshot" src="https://cloud.githubusercontent.com/assets/19576834/15733268/1bc40ae0-2839-11e6-8cc4-b9db8561d8ab.png">

Once that is set up and the ssh-tunnel established, point your browser that you configured foxyproxy with, to the following:

`http://<master-node>:8088`

for example,

http://ec2-54-204-150-54.compute-1.amazonaws.com:8088

This is the hadoop namenode web console.

If you have spark-shell running, you should see something like the following:

<img width="1423" alt="screenshot" src="https://cloud.githubusercontent.com/assets/19576834/15733354/013bbc58-283a-11e6-81d3-ef63e7a32fcb.png">

Click on the link to `ApplicationMaster` to access the Spark shell application UI.

Zeppelin Notebook can be accessed by going to: 
 
`http://<master-node>:8890`

## thaw

Apparently, while the AWS Console allows you to select groups of files in the S3 browser to restore from Glacier to normal S3 storage, it does _not_ allow you to select directories to recursively walk. `thaw` allows you to specify an S3 path, and it will individually begin restoration from Glacier to S3 for all files "below" the given path in the logical "directory" "structure" (all of this is really key-based, it's not a real directory). Anyway, it works just like any S3 recursive operation.

## gimme_dem_keys

On occasion, I'll wind up staring at a service provider page's settings page, showing me an MD5-style fingerprint of a keypair where I have no idea who in the organization it maps to. Even if it's me, I usually forget which `ssh-keygen` options give me the format I need.

This script allows you to just specify a github user, and prints out the common MD5 hash of their public key fingerprint.

```
3077-mbp:~ marc$ gimme_dem_keys
Usage: /Users/marc/bin/gimme_dem_keys USER

03077-mbp:~ marc$ gimme_dem_keys asdlsdlkfjs
Could not find keys for user: asdlsdlkfjs

03077-mbp:~ marc$ gimme_dem_keys slpsys
2048 MD5:97:ee:e5:9f:e5:87:00:8a:1d:c2:a8:a1:57:38:f7:e4 no comment (RSA)
2048 MD5:e1:71:2e:76:40:92:40:5f:14:e3:7e:77:29:9a:e5:b6 no comment (RSA)
2048 MD5:64:e5:f2:13:4a:fc:67:1d:4d:f7:dc:bb:64:b5:0b:43 no comment (RSA)
2048 MD5:c5:07:42:f5:1e:78:dc:86:45:09:35:a6:85:75:54:cf no comment (RSA)
```
