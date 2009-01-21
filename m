From: Dan Lyke <danlyke@flutterby.com>
Date: Wed, 21 Jan 2009 10:19:56 -0800
Subject: [Buildroot] Why can't I make u-boot twice?
Message-ID: <20090121101956.27301887@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Help!

I have a successful build. I do:

make u-boot-clean
make

and I get

cc     /home/danlyke/code/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/tools/mkimage.c
-o /home/danlyke/code/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/tools/mkimage /home/danlyke/code/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/tools/mkimage.c:61:19:
error: image.h: No such file or directory

followed by gobs of spew and, of course, an error and failure.

Any help?

Thanks.

Dan
