From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Aug 2010 12:08:21 +0300
Subject: [Buildroot] mini 2440 config nfs problems
In-Reply-To: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
References: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
Message-ID: <20100825090820.GE28629@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Belisko,
On Wed, Aug 25, 2010 at 10:48:09AM +0200, Belisko Marek wrote:
> playing with buildroot (2010.08_rc1) to build complete system for my
> mini 2440 board.
> I was able to build kernel and rootfs correctly but when I try to
> mount rootfs over nfs it
> always hangs with :
> 
> Freeing init memory: 120K
> Kernel panic - not syncing: Attempted to kill init!

We need more info:

1. Your kernel command line

2. The full console output of the kernel

3. The /etc/exports file on your NFS server

baruch

> Is there anything what I can check? This is not related to some EABI 
> tweaking?
> 
> Thanks for replies,
> 
> Marek

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
