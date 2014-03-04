From: Cyrille DERORY <cyrille.derory@derory.fr>
Date: Tue, 4 Mar 2014 10:22:11 +0100
Subject: [Buildroot] Buildroot 2014.02 : make on raspberry pi failed
Message-ID: <CACfHD-gFTUe-ybERH4tHGHx7b8zpvDv2ULY2m2eZ-=0WmJHfdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this my first days on buildroot and first post on this list.

I have tried to build for the raspberry pi target with the following :
make raspberrypi_defconfig
make

I have an error :

mkdir: impossible de cr?er le r?pertoire
? /home/cderory/T?l?chargements/buildroot/buildroot-2014.02/output/target/var/cache
?:
N'est pas un dossier
Makefile:507: recipe for target 'target-finalize' failed

"cache"  is not a directory.
 I have checked on "var" directory :

[cderory at EEE-PC-DERORY var]$ ls -la
total 40
drwxr-xr-x  3 cderory users 4096  4 mars  03:01 .
drwxr-xr-x 17 cderory users 4096  4 mars  03:01 ..
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 cache
drwxr-xr-x  2 cderory users 4096  4 mars  03:01 lib
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 lock
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 log
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 pcmcia
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 run
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 spool
-rwxr-xr-x  1 cderory users    6 27 f?vr. 21:51 tmp

As you can see, "cache" is a file, not a directory.

Am I wrong ?

Thanks for your help.


Cyrille DERORY
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140304/df43e41b/attachment-0001.html>
