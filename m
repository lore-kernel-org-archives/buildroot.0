From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 20 Dec 2017 14:35:30 -0200
Subject: [Buildroot] [PATCH 1/2] libdrm-armada: new package
In-Reply-To: <20171220150843.21154-2-didin@synopsys.com>
References: <20171220150843.21154-1-didin@synopsys.com>
 <20171220150843.21154-2-didin@synopsys.com>
Message-ID: <CAOMZO5DQsAVETVxn1u443H8XBpxj+K8Nn+st3_1xXe4cfsuWfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evgeniy,

On Wed, Dec 20, 2017 at 1:08 PM, Evgeniy Didin
<Evgeniy.Didin@synopsys.com> wrote:
> libdrm-armada is an Etnaviv libdrm buffer object management module.
> It is used with xf86-driver-video-armada, which is Xorg driver for Etnaviv.
>
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com

Is this patch really needed?

I was under the impression that it was only needed prior to Etnaviv
being supported in the official libdrm package.

Regards,

Fabio Estevam
