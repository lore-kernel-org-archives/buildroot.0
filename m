From: Michael <michtw@gmail.com>
Date: Tue, 10 Oct 2006 18:56:57 +0800
Subject: [Buildroot] ld.real: cannot find -lgcc_s
Message-ID: <901e5e350610100356t2524befep22a71d924c4961ce@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build the latest(20061009) buildroot but I ran into some
problems.
It's okay to complie the source.

------------------------------
-----------------------------------------------------------------------------
"/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-Wall -Wstrict-prototypes -Wshadow -Os -fstrict-aliasing
-fomit-frame-pointer -Dfork=vfork -D__PIC__ -fpic -msingle-pic-base -c
hello.c"
-----------------------------------------------------------------------------------------------------------

But when I trying to link the object I got some errors:
-----------------------------------------------------------------------------------------------------------
"/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-Wl,-elf2flt=-s32768 -fpic -msingle-pic-base -o hello hello.o"
"/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/build_arm_nofpu/staging_dir/bin-ccache/../lib/gcc/arm-linux-uclibc/3.4.2/../../../../arm-linux-uclibc/bin/ld.real:
cannot find -lgcc_s"
"collect2: ld returned 1 exit status"
-----------------------------------------------------------------------------------------------------------

How do I need to do to resolve the "cannot find -lgcc_s" problem?

Thanks in advance,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061010/02a4b885/attachment.html 
