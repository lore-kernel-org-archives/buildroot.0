From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 16:31:23 +0100
Subject: [Buildroot] qemu_microblazeel_mmu_defconfig: booting issue
In-Reply-To: <CANQCQpaZmxDtd+vVuvcPF9GDQjqNKOdJ5ddy3kX4wSuxbZf=kw@mail.gmail.com>
References: <CANQCQpaZmxDtd+vVuvcPF9GDQjqNKOdJ5ddy3kX4wSuxbZf=kw@mail.gmail.com>
Message-ID: <20141202163123.786d02c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Tue, 2 Dec 2014 08:48:38 -0600, Matthew Weber wrote:
> I grabbed the 2014.11 release and did a build using the
> qemu_microblazeel_mmu_defconfig.  I tried to execute it with "QEMU
> emulator version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.7)" using the
> command provided in the "board/qemu/microblazeel-mmu/readme.txt".
> 
> Spenser, what was the last kernel version you've successfully tested a
> build against?  I noticed there have been a few sweeping bumps of
> kernel versions that included this defconfig.

It was bumped by Gustavo recently, and I know Gustavo always boot
tests the Qemu defconfigs when doing the bumps. As written in
readme.txt, you should use Qemu 2.1.2, not Qemu 2.0.0. That's most
likely the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
