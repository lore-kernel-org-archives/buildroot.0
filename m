From: Jerry Richards <jerryr@tonecommander.com>
Date: Wed, 26 Sep 2007 13:03:52 -0700
Subject: [Buildroot] Compilation Error Using Buildroot
Message-ID: <001801c80078$5d2cc5f0$2c48a8c0@greyhawk.tonecommander.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

I am using buildroot for a MIPS processor and encountered a compilation
error in an application module I added to the build environment (see build
output excerpt attachment).  It states "./.libs/libsu.a: could not read
symbols: Archive has no index; run ranlib to add one", yet a couple of lines
earlier shows "ranlib .libs/libsu.a" already executed.

Could someone take a quick look at this?  I don't see how GCC gets this
error.  Perhaps there is some configuration option missing?

Best Regards,
Jerry
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: CompilerError.txt
Url: http://busybox.net/lists/buildroot/attachments/20070926/61a6c4cc/attachment.txt 
