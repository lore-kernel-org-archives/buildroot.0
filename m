From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Feb 2018 23:36:26 -0200
Subject: [Buildroot] [PATCH v2 0/2] Xorg: enable Etnaviv support
In-Reply-To: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
Message-ID: <CAOMZO5AdVkKu8iVcOi1Baw-v5iHgON4MMw7X+cwSNmgVkNrf5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evgeniy,

On Fri, Feb 2, 2018 at 12:55 PM, Evgeniy Didin
<Evgeniy.Didin@synopsys.com> wrote:
> From: Evgeniy Didin <didin@synopsys.com>
>
> This patch series enables Etnaviv support in Xorg.
>
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
>
> Evgeniy Didin (2):
>   libdrm-armada: new package
>   xf86-video-armada: new package

Thanks for this series.

I would be interested in testing it.

From your previous version, it looks like you also used a imx6 wandboard.

Could you please share the defconfig changes you did in wandboard and
also the command lines you used to launch X11?

Thanks
