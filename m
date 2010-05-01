From: Sameer Bobade <skbobade@gmail.com>
Date: Sat, 1 May 2010 17:05:10 +0530
Subject: [Buildroot] Build Error!
In-Reply-To: <j2ma3e4d2d61005010430hb5d94b22ia8ce4d39a84c52a7@mail.gmail.com>
References: <j2ma3e4d2d61005010430hb5d94b22ia8ce4d39a84c52a7@mail.gmail.com>
Message-ID: <u2sa3e4d2d61005010435i99dc0cfbi6ab02762e7788da1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build the Linux Kernel 2.6 for i386 core 2.

I gave make command after configuration and during the process of *gmp
*following
error came:


configure: WARNING: you should use --build, --host, --target
configure: WARNING: you should use --build, --host, --target
configure: error: --target is not appropriate for GMP
Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
manual for more on this).
make: ***
[/home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host/.configured]
Error 1




Please tell me how to work around...


-- 
Yours,
Sameer Bobade.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100501/55a63c5b/attachment-0001.htm>
