From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 3 Jan 2020 07:22:54 +0800
Subject: [Buildroot] [PATCH 2/2] board/stm32mp157c-dk2: remove
 unnecessary workaround
In-Reply-To: <20200101172137.4457a417@windsurf>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <20191103115017.788940-2-b.bilas@grinn-global.com>
 <20200101172137.4457a417@windsurf>
Message-ID: <CAFkzVZbu5myL8g1QXJML9N1U9AfmO-4bCVRi9eBY-kmiDkj+dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

Is possible to bump linux kernel to version 5.4.7? The 5.3.x series has
been EOL,  the "longterm maintenance" series will be acceptable.

Thanks.

On Thu, Jan 2, 2020, 00:21 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Sun,  3 Nov 2019 12:50:17 +0100
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
> > Since we know the proper solution, remove that faulty patch.
> >
> > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> > ---
> >  ...-fix-checking-the-presence-of-an-env.patch | 37 -------------------
> >  configs/stm32mp157c_dk2_defconfig             |  1 -
> >  2 files changed, 38 deletions(-)
> >  delete mode 100644
> board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
>
> Applied to master after improving the commit log. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200103/a2e2ff23/attachment.html>
