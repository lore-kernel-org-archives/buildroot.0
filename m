From: Luis Machi <lmachi@latinmail.com>
Date: Fri, 28 Sep 2007 23:20:32 +0200 (CEST)
Subject: [Buildroot] unionfs - kernel patching
Message-ID: <20070928212032.6D845E3571B@smtp.latinmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

How do I integrate the following patch to Linux 2.6.x (x86 target)?

unionfs-2.1.5_for_2.6.22.6  at  http://www.filesystems.org/project-unionfs.html

I read http://buildroot.uclibc.org/buildroot.html , but didn't quite understand how to do it.

I tried putting it both un&compressed forms to ./target/device/x86/i386/kernel-patches/ , and setting LINUX26_PATCH_DIR:=$(BR2_BOARD_PATH)/kernel-patches in ./target/device/x86/i386/Makefile.in

Thanks!


La temporada de huracanes y el terremoto de Peru, a un click http://wwwstarmedia.com/noticias/especiales/desastresnaturales.html
