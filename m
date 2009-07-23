From: loody <miloody@gmail.com>
Date: Thu, 23 Jul 2009 16:15:17 +0800
Subject: [Buildroot] error about compile gcc
Message-ID: <3a665c760907230115w47500c7ai1e7a8339f01e907a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all:
I use buildroot to build mipsel toolchain and I got the error message below:
/media/sda6/uclinux/toolchain/mips/temp/buildroot-2009.05/build_mipsel/staging_dir/usr/include/unistd.h:243:
error: two or more data types in declaration specifiers

I have google the error
message,http://osdir.com/ml/lib.uclibc.buildroot/2007-06/msg00076.html,
 but the error still exist even I use "--disable-libmudflap ".

My buildroot version is 2009.05, Released June 1st, 2009
If someone has the same error as me before, please let me know.
appreciate your help,
miloody
