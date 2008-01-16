From: Paul <pbor1234@zonnet.nl>
Date: Wed, 16 Jan 2008 19:46:41 +0100
Subject: [Buildroot] How to configure proftpd 1.3.0a package in buildroot
Message-ID: <20080116184646.F0F9FC78A@green.qinip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a newby i'm stuck in the following, help is appreciated.

I have selected the proftpd (1.3.0a) package in 'make menuconfig' and it
build fine.

Now I want to add the iconv patch (see for example
http://home.h01.itscom.net/para/software/misc/proftpd-iconv/index-e.html)
where it is described to run ./configure with some options to add the
modules in question. If i do this (in the buildroot/build_powerpc/...) it
fails and i think this is due to the fact that the staging_dir tools should
be used which is not done the way i run ./configure.

 

My question: how should i do this correctly?

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080116/aa45d548/attachment.htm 
