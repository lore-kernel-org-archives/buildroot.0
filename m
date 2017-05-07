From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 May 2017 15:32:45 +0200
Subject: [Buildroot] Kodi 17.1 - segfault - arm - gcc 5.x
References: <CACPGbctoBjhuJ8PVCziKzJpN8j5KnPTKOkX6Sk9OZtniQVvVhw@mail.gmail.com>
Message-ID: <t8k3udxufq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Fri, 05 May 2017 15:12:01 +0200 schrieb Nicolas Adenis-Lamarre:

> Kodi 17.1 won't compile with gcc 4.9.

What happened? I could build Kodi right now using this defconfig:

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_FPU_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_9=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

> I've upgraded to 5.4, but the segfaults came back.
> 
> I've reproduced on rpi2 and odroid xu4. i've not managed to reproduce on
> x86.

can you provide a gdb backtrace?
FYI: I do not have access to arm hardware so maybe I can not help much.

> For information, the kodi-joystick package should be added in buildroot
> while it's usefull on embeded devices :
> https://github.com/nadenislamarre/batocera.linux/tree/master/package/
batocera/kodi-joystick

http://patchwork.ozlabs.org/patch/759427/

Regards, Bernd
