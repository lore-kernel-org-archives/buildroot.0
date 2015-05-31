From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 May 2015 12:18:21 +0300
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig
 and bootable microSD Bash script
In-Reply-To: <alpine.DEB.2.11.1505311052260.1709@tanhuma.tkos.co.il>
References: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
 <20150529044005.GM2260@tarshish>
 <alpine.DEB.2.11.1505291022180.2289@tanhuma.tkos.co.il>
 <20150531062503.GC2282@tarshish>
 <alpine.DEB.2.11.1505311052260.1709@tanhuma.tkos.co.il>
Message-ID: <20150531091821.GG2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Sun, May 31, 2015 at 10:57:25AM +0300, Jonathan Ben Avraham wrote:
> On Sun, 31 May 2015, Baruch Siach wrote:
> >On Fri, May 29, 2015 at 10:56:14AM +0300, Jonathan Ben Avraham wrote:
> >>6. Having a separate script takes into account the fact that we are using
> >>forked U-Boot repo whose bootcmd might change from the bootcmd in the
> >>upstream repo.
> >
> >Which bootcmd you refer to? Is it the U-Boot autoboot environment variable?
> 
> Yes. This script takes into account that Solid-Run could change the kernel
> command line to use a rootfs in the first or third partition for example. to
> do that with board/freescale/create-boot-sd.sh we would need to add extra
> parameters or env vars.

That's 'bootargs' I believe, isn't it? See my email on v2 for an alternative 
solution (boot.src).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
