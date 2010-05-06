From: Wagner, Scott <swagner@vanteon.com>
Date: Thu, 6 May 2010 12:52:13 -0400
Subject: [Buildroot] Kernel headers from an externally built kernel
Message-ID: <C5029C549AA03148AF1B73C0F27DC86D016F1B7C@mse2003.vanteonrdc.vanteon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I would like to use buildroot to create a root file system only - I have
an external toolchain and an external cross-built kernel made with that
toolchain.

 

How do I configure buildroot to reference the external kernel's headers?
In poking through the makefiles, it looks like this is possible, but I
have not yet found a way to specify it through menuconfig or by feeding
environment variables to make.  I'm currently building with
BR2_KERNEL_none=y.

 

I think that as a result buildroot is trying to use the host platform's
kernel headers, because the busybox build fails looking for an mtd
header file, which is not present in the host's kernel headers - but
this is just a guess.

 

Any ideas?  Thanks in advance ...

 

Scott Wagner
Rochester, NY US

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100506/29d39ac6/attachment.htm>
