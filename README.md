# putio-automator
Dockerized version of datashaman/putio-automator

While searching for a good automation for managing my files on put.io I found the excellent python script https://github.com/datashaman/putio-automator/, it did pretty much everything I wanted, and even offered a docker container option. However, when installing this on my Mac I discovered that I couldn't run putio-automatoer natively because of some issues with missing dependent packages that weren't available. That led me to try to run the containerized version instead. But, with the default setup he's assuming that you'll kick off that container by running his Python script, meaning you still have to install putio-automator on the host OS. Similarly, the resulting image that installs is excessively large and adds in a web server that I didn't need.

With this container I've attempted to go as small as possible by using Alpine as the base image and only installing python and putio-automator. This gets the image quite a bit smaller and just presents you with a entry point to putio-automator. This keeps your host OS clean while still giving you a very nice automation for put.io.

Usage
----

At the moment, this is just setup to run a script that will scan your torrents directory and add them to put.io, then kick off a download job of any completed downloads. At the end the container will die.
