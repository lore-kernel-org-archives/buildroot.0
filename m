From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 2 Dec 2014 08:54:50 -0600
Subject: [Buildroot] qemu_microblazeel_mmu_defconfig: booting issue
In-Reply-To: <CANQCQpaZmxDtd+vVuvcPF9GDQjqNKOdJ5ddy3kX4wSuxbZf=kw@mail.gmail.com>
References: <CANQCQpaZmxDtd+vVuvcPF9GDQjqNKOdJ5ddy3kX4wSuxbZf=kw@mail.gmail.com>
Message-ID: <CANQCQpagL0F9W+3GmzVPPO-vBT7wn+VuPu94G=T9sN9bbf_Quw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 2, 2014 at 8:48 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> I grabbed the 2014.11 release and did a build using the
> qemu_microblazeel_mmu_defconfig.  I tried to execute it with "QEMU
> emulator version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.7)" using the
> command provided in the "board/qemu/microblazeel-mmu/readme.txt".
>
> Spenser, what was the last kernel version you've successfully tested a
> build against?  I noticed there have been a few sweeping bumps of
> kernel versions that included this defconfig.
>
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com

Oops, I left out that qemu had no output after starting the emulation.
