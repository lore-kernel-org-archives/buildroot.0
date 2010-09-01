From: Madhusudan Madhusudan <coolmadhus@gmail.com>
Date: Wed, 1 Sep 2010 11:23:51 +0530
Subject: [Buildroot] arm-unknown-linux-uclibcgnueabi-ld: no machine record
	defined
Message-ID: <AANLkTimZ9c9j1RxjxRUVY8=MfKvDrfvVv7mNGarVSsfz@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
            I am using buildroot-2010.08 for omapl138 - hawkboard.When iam
trying to build the kernel image,i get a message
*arm-unknown-linux-uclibcgnueabi-ld:
no machine record defined .*The build sequence is also mentioned
below.Kindly reply.

Thanks & Regards
Madhu
----------------------------------------------------------------------------------------------------------------------------
make[1]: Entering directory
`/home/jagadish/bl_root_test/buildroot-2010.08-rc1/output/build/linux-2.6.34.1'
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[2]: `include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
/home/jagadish/bl_root_test/buildroot-2010.08-rc1/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-ld:
no machine record defined
/home/jagadish/bl_root_test/buildroot-2010.08-rc1/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-ld:
no machine record defined
/home/jagadish/bl_root_test/buildroot-2010.08-rc1/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-ld:
no machine record defined
drivers/built-in.o: In function `musb_stop':
hid-quirks.c:(.text+0x925a8): undefined reference to `musb_platform_disable'
drivers/built-in.o: In function `musb_shutdown':
hid-quirks.c:(.text+0x92644): undefined reference to `musb_platform_disable'
drivers/built-in.o: In function `musb_mode_store':
hid-quirks.c:(.text+0x92930): undefined reference to
`musb_platform_set_mode'
drivers/built-in.o: In function `musb_start':
hid-quirks.c:(.text+0x93334): undefined reference to `musb_platform_enable'
drivers/built-in.o: In function `musb_probe':
hid-quirks.c:(.init.text+0x4f30): undefined reference to
`musb_platform_init'
hid-quirks.c:(.init.text+0x4f94): undefined reference to
`musb_platform_disable'
hid-quirks.c:(.init.text+0x5790): undefined reference to
`musb_platform_exit'
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory
`/home/jagadish/bl_root_test/buildroot-2010.08-rc1/output/build/linux-2.6.34.1'
make: ***
[/home/jagadish/bl_root_test/buildroot-2010.08-rc1/output/build/linux-2.6.34.1/.stamp_compiled]
Error 2
[jagadish at LinuxPC buildroot-2010.08-rc1]$
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100901/9504edc5/attachment.html>
