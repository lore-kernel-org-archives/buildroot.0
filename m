From: Gianluca <funeral_party80@yahoo.it>
Date: Wed, 17 Mar 2010 04:50:35 -0700 (PDT)
Subject: [Buildroot] R: How to compile oprofile when using an external
	binary toolchain
In-Reply-To: <570395.74949.qm@web24805.mail.ird.yahoo.com>
Message-ID: <635340.71959.qm@web24812.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please, is there someone who could help me with this issue?
Thank you

mrA


--- Mer 10/3/10, Gianluca <funeral_party80@yahoo.it> ha scritto:

Da: Gianluca <funeral_party80@yahoo.it>
Oggetto: [Buildroot] How to compile oprofile when using an external binary toolchain
A: buildroot at busybox.net
Data: Mercoled? 10 marzo 2010, 14:07

Hi all,

I'm trying to compile oprofile for a mipsel platform but I'm using an external binary toolchain and so when it tries to compile binutils it can't download the right binutils package because the version is not specified in .config.
I've tried to hack that by forcing the compilation of binutils 2.19.1 and it worked...but when I went finally to the last oprofile linking process I got some very strange linker errors like these:

non-dynamic relocations refer to dynamic symbol strcpy

and

failed to set dynamic section sizes: Bad value

Is there a "standard" way of compiling oprofile when using the external toolchain?
Thank you.

mrA





      
-----Segue allegato-----

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100317/55891c4d/attachment.htm>
