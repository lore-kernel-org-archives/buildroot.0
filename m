From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 2 Jun 2021 19:19:25 +0300
Subject: [Buildroot] [PATCH/RFC 00/28] sunxi: switch to mainline ATF
In-Reply-To: <CAEyMn7a6wLjxHVV1fO3PL7pWjrOnaAuhAAC9jDvM-biSORmRoA@mail.gmail.com>
References: <20210531212748.2378872-1-geomatsi@gmail.com>
 <CAEyMn7a6wLjxHVV1fO3PL7pWjrOnaAuhAAC9jDvM-biSORmRoA@mail.gmail.com>
Message-ID: <YLevjeOAyN3kaLng@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

> > Hi all,
> >
> > This patch set updates BSP on H5/A64 sunxi boards. For each board
> > the following changes are implemented:
> >
> > - switch from early Allwinner ATF port to mainline ATF
> > - bump Linux kernel and U-Boot versions
> >
> > Note that I have only orangepi-zero-plus2 board at my disposal. So only
> > this board has been tested. For all the other boards only build tests
> > have been completed. Any help with boot tests on other H5/A64 sunxi
> > boards is more than welcome.
> 
> Are you aware that we already bumped the ATF version to v2.5 in the
> next branch [1] and do you stick to v2.4 in all your changed
> defconfigs to avoid any regression?
> 
> [1] https://git.buildroot.net/buildroot/commit/?h=next&id=cb5d9fdf1ebf7002a29e6fa43c817611e2e4e8d1

No, I missed that commit. Thanks for letting me know. Anyway, I posted
the patches as RFC to collect some feedback and probably get some help
with testing. So in the next revision of the patches I will use v2.5.

Regards,
Sergey
