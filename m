From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 16 Apr 2020 13:54:43 +0300
Subject: [Buildroot] [PATCH 1/2] configs/solidrun_macchiatobin_mainline:
 bump bsp versions
In-Reply-To: <20200415230753.1c02ad80@windsurf.home>
References: <20200415134136.580543-1-geomatsi@gmail.com>
 <20200415134136.580543-2-geomatsi@gmail.com>
 <20200415230753.1c02ad80@windsurf.home>
Message-ID: <20200416105443.mi77ednircgb23lq@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Bump Linux to 5.6.3, U-Boot to 2020.01. New kernel and modules based
> > on arm64 defconfig do not fit into default size filesystem anymore.
> > So increase filesystem size to 120M.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  configs/solidrun_macchiatobin_mainline_defconfig | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> Applied to master, thanks. It would be good to see of upstream ATF
> could be used instead of the Marvell-specific version.

I plan to try upstream ATF. But not yet: at the moment I have only
remote access to those boards. So it is a bit risky to experiment
with early boot sequence :)

Meanwhile according to quick comparison between vendor and upstream
ATF versions for Marvell SoCs, PCIe driver is not yet in upstream.
Though I am not sure what could be the implications for the kernel.

Thanks,
Sergey
