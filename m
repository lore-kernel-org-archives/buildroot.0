From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 16 Feb 2010 00:03:08 +0100
Subject: [Buildroot] how to package without ./configure  ?
Message-ID: <6FADFC617AC54BA0A81944E2AF1D1FFB@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I have a package  that only contains a shell script (bootstrap.sh) to
generate ./configure 
Once i have run the script manualy i can continue with make.
 
How can i  change the makefile so that the bootstrap.sh is first executed
(just after the extraction ) before the eval autotargets stuff  call the
./confure step ?
 
Or  is the eval autotargets not suitable for this package ?
 
(this is the package :
http://ftp.de.debian.org/debian/pool/main/libu/libupnp4/libupnp4_1.8.0~cvs20
080628.orig.tar.gz )
 
Johan
 
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100216/d6c861a4/attachment-0001.htm>
