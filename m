From: Matthieu Torres <matthieu.torres4@libertysurf.fr>
Date: Wed, 02 Dec 2009 21:19:53 +0100
Subject: [Buildroot] rrdtool :  new package proposal
Message-ID: <4B16CBE9.9030602@libertysurf.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is a patch that adds a new package "rrdtool" in packages/database/. 
This is a data logging and graphing system for time series data (see 
http://oss.oetiker.ch/rrdtool/).

BIG FAT WARNING: I am new to buildroot and to rrdtool. So it may be 
buggy, and not be done "as it should be". For example, the patch I 
submit hardcodes time_t type to long in rrdtool's configure script. 
There must be a cleaner way to do this.

It builds for me (target : geode processor, 2.6.31-RT-PREEMPT linux, 
libc external tool chain), but I have not tested this package with other 
targets. I have not either really tested the proper functionning of the 
binaries.

Hoping it will be usefull to someone...

-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.patch
Type: text/x-diff
Size: 9013 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091202/ebe5ae3c/attachment-0001.bin>
