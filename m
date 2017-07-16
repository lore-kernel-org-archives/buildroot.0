From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 15:41:52 +0200
Subject: [Buildroot] [PATCH v2 4/8] grub2: enable support for arm and
 aarch64 targets
In-Reply-To: <20170426213953.14904-5-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
 <20170426213953.14904-5-nunes.erico@gmail.com>
Message-ID: <20170716154152.7a9191ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 23:39:49 +0200, Erico Nunes wrote:

> These targets have been tested in the following environments:
> 
> arm-uboot: qemu arm vexpress and BeagleBone
> arm-efi: BeagleBone
> aarch64-efi: qemu aarch64 virt and Odroid-C2

It would be nice to create some tests in the runtime tests
infrastructure to test Grub2 on ARM/ARM64. We already test it on x86
through the ISO9660 tests.

But OK, this can be added at a later point.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
