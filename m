From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 29 Jul 2017 20:15:54 +0200
Subject: [Buildroot] [PATCH 2/4] binutils: add support for binutils 2.29
In-Reply-To: <20170729130906.2140-3-thomas.petazzoni@free-electrons.com>
References: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
 <20170729130906.2140-3-thomas.petazzoni@free-electrons.com>
Message-ID: <20170729181554.GF28707@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> All patches from binutils 2.28 are kept, except patch
> 0906-microblaze-pr21180.patch, because it has been merged upstream as
> of commit bd757ca7bf5886a4025ca02093fca1b8c5ce11a2. Other patches are
> slightly adapted to differences that appeared in binutils 2.29.
> 
> The patches are now all Git formatted, so instead of having weird
> sequence numbers, they have normal sequence numbers starting from 0001
> and incrementing.
> 
> Since binutils 2.29 is now available as a .tar.xz tarball, we use this
> format instead of .bz2 used for previous versions.

I am testing some more qemu defconfigs with binutils 2.29.
sh4/sparc worked fine. But xtensa fails to compile busybox:

/home/wbx/buildroot/output/host/lib/gcc/xtensa-buildroot-linux-uclibc/6.4.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
BFD (GNU Binutils) 2.29 assertion fail elf32-xtensa.c:3965

Adding Max to Cc.

best regards
 Waldemar
