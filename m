From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 5 Dec 2014 12:21:21 +0000
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.17.3
In-Reply-To: <1417781537-18796-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417781537-18796-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5481A341.50201@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

built fine for MIPS and checked the binaries are in place and built for
the right architecture:

$ file output/target/usr/bin/btrfs
output/target/usr/bin/btrfs: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.16, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

$ ls output/target/usr/bin/btrfs*
output/target/usr/bin/btrfs             output/target/usr/bin/btrfs-image
output/target/usr/bin/btrfsck
output/target/usr/bin/btrfs-map-logical
output/target/usr/bin/btrfs-convert
output/target/usr/bin/btrfs-show-super
output/target/usr/bin/btrfs-debug-tree  output/target/usr/bin/btrfstune
output/target/usr/bin/btrfs-find-root   output/target/usr/bin/btrfs-zero-log

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
