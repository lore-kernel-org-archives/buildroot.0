From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Mar 2012 18:44:37 -0300
Subject: [Buildroot] Qemu microblaze sample configurations
Message-ID: <1332193479-7415-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add sample qemu targets for little & big endian MMU microblaze targets for testing.
Hopefully we can get non-mmu variants going soon.

system.dts is just a placeholder since it's not an option to ignore it
right now, qemu uses it's own dtb for the s3adsp1800 emulation (which
lacks a corresponding dts source unfortunately).

kernel-3.3.config is the default linux 3.3 kernel defconfig for generic
mmu with lowered/disabled instructions that aren't emulated.
