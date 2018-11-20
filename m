From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 20 Nov 2018 23:03:13 +0300
Subject: [Buildroot] [PATCH next 4/5]
 configs/solidrun_macchiatobin_mainline: bump kernel and U-Boot
In-Reply-To: <87h8gbfzzv.fsf@tkos.co.il>
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
 <2ef4e9d2b5fff465da879d99e412437ea7109b66.1542720610.git.baruch@tkos.co.il>
 <20181120163104.wxmaqro2yukllssf@bars> <87h8gbfzzv.fsf@tkos.co.il>
Message-ID: <20181120200313.GA2117@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >> ---
> >>  board/solidrun/macchiatobin/extlinux.conf          |  4 ++++
> >>  board/solidrun/macchiatobin/linux-extras.config    |  2 +-
> >>  board/solidrun/macchiatobin/post-build-mainline.sh |  5 +++++
> >>  board/solidrun/macchiatobin/uboot-fragment.config  |  2 ++
> >>  configs/solidrun_macchiatobin_mainline_defconfig   | 13 ++++++++-----
> >>  5 files changed, 20 insertions(+), 6 deletions(-)
> >>  create mode 100644 board/solidrun/macchiatobin/extlinux.conf
> >>  create mode 100755 board/solidrun/macchiatobin/post-build-mainline.sh
> >>  create mode 100644 board/solidrun/macchiatobin/uboot-fragment.config
> >  
> > Thanks! Verified the changes on MacchiatoBin v2 board:
> >
> > Tested-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Thanks.
> 
> > By the way, it looks like mainline U-Boot v2018.11 still detects only 2GiB
> > of DRAM on my boards. Meanwhile vendor U-Boot provided by alternative
> > config solidrun_macchiatobin_marvell_defconfig detects 4GiB.
> 
> Support for RAM size detection on Armada 8K platforms is pending:
> 
>   http://git.denx.de/?p=u-boot/u-boot-marvell.git;a=commitdiff;h=2b4d964718c0e78a24f3a5e051e7dd9bc0e547c2
> 
> The next U-Boot release should have this support.

Good! Thanks for the link.

Regards,
Sergey
