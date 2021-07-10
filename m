From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 10 Jul 2021 15:30:35 -0300
Subject: [Buildroot] [PATCH] configs/imx7dpico: bump Kernel and U-Boot
 version
In-Reply-To: <CAOMZO5CcUz8YQT6qtDc4BUy3zZE_h1+GRNK45CYinnZ-DqGfxg@mail.gmail.com>
References: <20210710182137.3720-1-texier.pj2@gmail.com>
 <CAOMZO5CcUz8YQT6qtDc4BUy3zZE_h1+GRNK45CYinnZ-DqGfxg@mail.gmail.com>
Message-ID: <CAOMZO5CdGhGW3AHHPakLrT04sMyxEioJhaSEoXL6zDiCeuuu0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pierre-Jean,

On Sat, Jul 10, 2021 at 3:27 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Sat, Jul 10, 2021 at 3:21 PM Pierre-Jean Texier <texier.pj2@gmail.com> wrote:
> >
> > Bump U-Boot to 2021.07 and kernel to version 5.13
> >
> > Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
>
> Thanks for the patch:
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

I forgot to ask: shouldn't we pass a extlinux.conf file so that it can
boot by default now
as it uses distro boot in U-Boot?

Thanks
