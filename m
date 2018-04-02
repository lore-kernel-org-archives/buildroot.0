From: daggs <daggs@gmx.com>
Date: Mon, 2 Apr 2018 16:46:09 +0200
Subject: [Buildroot] implicit declaration of function 'vrndn_f64' on glibc
 compile
Message-ID: <trinity-f6a28c8f-3ca2-4b49-9be8-4999aeb2e006-1522680369881@3c-app-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've tried to build a odroidc2 based image with glibc instead of uclibc and the build process fails with the following error:
../sysdeps/aarch64/fpu/math_private.h:332:3: error: implicit declaration of function 'vrndn_f64' [-Werror=implicit-function-declaration]

has anyone encountered this issue before?
steps to reproduce:
1. checkout buildroot master.
2. run make odroidc2_defconfig
3. run make menuconfig and change the libc to glibc.
4. rum make.

Dagg.
