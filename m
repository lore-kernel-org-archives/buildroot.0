From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 10 Dec 2017 12:09:22 +0300
Subject: [Buildroot] [PATCH v4] solidrun/macchiatobin: add new board
In-Reply-To: <20171210082207.54dh765y5xtiwunh@tarshish>
References: <20171209121720.14701-1-geomatsi@gmail.com>
 <20171210082207.54dh765y5xtiwunh@tarshish>
Message-ID: <20171210090922.hvzkveuad7zv5d6k@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

> Hi Sergey,
> 
> On Sat, Dec 09, 2017 at 03:17:20PM +0300, Sergey Matyukevich wrote:
> > Add MacchiatoBin board by SolidRun. This board is based on Marvell
> > Armada 8040 SoC. Board support package includes the following
> > two options: mainline and vendor BSPs.
> > 
> > Mainline BSP:
> > - Marvell ATF v1.3-armada-17.10
> > - mainline U-Boot v2017.11
> > - mainline Linux kernel v4.14.4
> > 
> > Marvell BSP with more hardware support enabled:
> > - Marvell ATF v1.3-armada-17.10
> > - Marvell U-Boot based on v2017.03
> > - Marvell Linux kernel based v4.4.52
> > 
> > More details about this board are available on wiki:
> > - http://wiki.macchiatobin.net
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> 
> [...]
> 
> > +How to boot the board
> > +=====================
> > +
> > +MacchiatoBin board can be setup to load bootloader from different
> > +sources including eMMC, SPI flash, and SD-card. In order to select
> > +boot from SD-card DIP switches SW1 and SW2 should be configured
> > +as follows:
> > +SW2: 01110
> > +SW1: 1xxxx
> 
> The upcoming revision 1.3 of the Macchiatobin will have a single pins header 
> (J1) instead of the SW1/2 DIP switches. The setting of J1 jumpers matches the 
> DIP switches of earlier revisions from left to right:
> 
>   011101xxxx
> 
> This is also marked on the PCB.

Thanks, noted. I plan to update mcbin board files after kernel v4.15 is out.
So I will queue this board info update into that change as well.

Regards,
Sergey
