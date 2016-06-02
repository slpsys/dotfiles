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

Once that is set up and the ssh-tunnel established, just point your browser that you configured foxyproxy with, to the following:

`http://<master-node>:8088`

for example,

http://ec2-54-204-150-54.compute-1.amazonaws.com:8088

This is the hadoop namenode web console.

If you have spark-shell running, you should see something like the following:

<img width="1423" alt="screenshot" src="https://cloud.githubusercontent.com/assets/19576834/15733354/013bbc58-283a-11e6-81d3-ef63e7a32fcb.png">

Just click on the link to `ApplicationMaster` to access the Spark shell application UI.

## thaw

Apparently, while the AWS Console allows you to select groups of files in the S3 browser to restore from Glacier to normal S3 storage, it does _not_ allow you to select directories to recursively walk. `thaw` allows you to specify an S3 path, and it will individually begin restoration from Glacier to S3 for all files "below" the given path in the logical "directory" "structure" (all of this is really key-based, it's not a real directory). Anyway, it works just like any S3 recursive operation.
