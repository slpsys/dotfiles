# Scripts

## spark-cli

A simple wrapper around the `aws` cli tool, which this assumes is set up correctly already. The use case here is for development clusters, where you may create a cluster once, store data to HDFS, go home, play around some more, and want a simple tool for coordinating.

The commands are simply:
* `spark-cli start`
* `spark-cli ssh`
* `spark-cli stop`

Where start will create a `~/.spark-session.lock` file locally with your cluster id. You can use this for subsequent `ssh` and `stop` calls, which will look for the file, read the cluster id, and act appropriately.

Everything is configurable via environment variables (and you'll get barked at if they're not set). See spark.sh (which goes in your `.bash_includes` dir) for which (or get yelled at).
