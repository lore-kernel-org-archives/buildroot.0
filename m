From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 17:02:15 +0200
Subject: [Buildroot] [PATCH 00/19] Qemu sample configuration bumps
In-Reply-To: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 Oct 2014 09:29:35 -0300")
References: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvezhqiw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > This patch series updates the kernel and candidate qemu versions to the
 > latest possible versions.
 > The relevant kernel configurations are updated to switch from ext2 to ext4
 > since it covers more use cases.
 > ext* support was removed for platforms that are very unlikely to boot/use that
 > kind of filesystem (microblaze).

 > Status matrix:

 > Defconfig               Kernel          Qemu    Network Status
 > --------------------------------------------------------------
 > aarch64_virt            3.17            2.1.2   YES     OK
 > arm_nuri                3.10.56         2.1.2   YES(1)  OK most times(2)
 > arm_versatile           3.17            2.1.2   YES     OK
 > arm_vexpress            3.17            2.1.2   YES     OK
 > microblazebe            3.17            2.1.2   YES     OK
 > microblazeel            3.17            2.1.2   YES     OK
 > mips64el_malta          3.17            2.1.2   YES     OK
 > mips64_malta            3.17            2.1.2   YES     OK
 > mipsel_malta            3.17            2.1.2   YES     OK
 > mips_malta              3.17            2.1.2   YES     OK
 > ppc_g3beige             3.17            2.1.2   YES     OK
 > ppc_mpc8544ds           3.17            2.0.2   YES     OK(3)
 > ppc_virtex_ml507        3.17            2.1.2   NO      OK
 > ppc64_pseries           3.17            2.1.2   YES     OK
 > sh4                     3.17            2.1.2   YES     OK
 > sparc_ss10              3.17            2.1.2   YES     OK
 > x86                     3.17            2.1.2   YES     OK
 > x86_64                  3.17            2.1.2   YES     OK
 > xtensa_lx60             3.17            2.1.2   YES     OK

 > (1) - Supposed to work but broken, probably Qemu emulation issue
 > (2) - In like 1/3 starts it fails to work properly
 > (3) - Qemu 2.1.x doesn't show up anything (broken)

Committed series, thanks!

-- 
Bye, Peter Korsgaard
