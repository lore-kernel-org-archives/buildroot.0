From: Gianluca <funeral_party80@yahoo.it>
Date: Wed, 10 Mar 2010 05:07:32 -0800 (PST)
Subject: [Buildroot] How to compile oprofile when using an external binary
	toolchain
Message-ID: <570395.74949.qm@web24805.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to compile oprofile for a mipsel platform but I'm using an external binary toolchain and so when it tries to compile binutils it can't download the right binutils package because the version is not specified in .config.
I've tried to hack that by forcing the compilation of binutils 2.19.1 and it worked...but when I went finally to the last oprofile linking process I got some very strange linker errors like these:

non-dynamic relocations refer to dynamic symbol strcpy

and

failed to set dynamic section sizes: Bad value

Is there a "standard" way of compiling oprofile when using the external toolchain?
Thank you.

mrA



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100310/d712e032/attachment.htm>
