From: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Date: Wed, 5 Mar 2014 15:23:31 +0100
Subject: [Buildroot] microblaze (big endian)
Message-ID: <20140305142331.GH4148@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi developers,

I am trying to build buildroot-2014.02 for microblaze (big endian),
but startup of qemu fails in userland with OOM killer.

I extracted the archive, run:
make qemu_microblazebe_mmu_defconfig
make
qemu-system-microblaze -M petalogix-s3adsp1800 -kernel
output/images/linux.bin -serial stdio

qemu-system-microblaze -version
QEMU emulator version 1.7.0, Copyright (c) 2003-2008 Fabrice Bellard

Build on Debian/amd64 sid. On another Debian/amd64 7 installation
I tried current git, but startup fails with:
Kernel panic - not syncing: junk in compressed archive

Any ideas?

Thanks in advance
        Waldemar Brodkorb
