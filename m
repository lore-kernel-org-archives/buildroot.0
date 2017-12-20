From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 20 Dec 2017 17:02:06 +0000
Subject: [Buildroot] [PATCH 1/2] libdrm-armada: new package
In-Reply-To: <CAOMZO5DQsAVETVxn1u443H8XBpxj+K8Nn+st3_1xXe4cfsuWfg@mail.gmail.com>
References: <20171220150843.21154-1-didin@synopsys.com>
 <20171220150843.21154-2-didin@synopsys.com>
 <CAOMZO5DQsAVETVxn1u443H8XBpxj+K8Nn+st3_1xXe4cfsuWfg@mail.gmail.com>
Message-ID: <1513789325.21982.16.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio, Lucas,

On Wed, 2017-12-20 at 14:35 -0200, Fabio Estevam wrote:
> Hi Evgeniy,
> 
> On Wed, Dec 20, 2017 at 1:08 PM, Evgeniy Didin
> <Evgeniy.Didin@synopsys.com> wrote:
> > libdrm-armada is an Etnaviv libdrm buffer object management module.
> > It is used with xf86-driver-video-armada, which is Xorg driver for
> > Etnaviv.
> > 
> > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: arc-buildroot at synopsys.com
> 
> Is this patch really needed?
> 
> I was under the impression that it was only needed prior to Etnaviv
> being supported in the official libdrm package.
> 
Following this message:
https://www.spinics.net/lists/dri-devel/msg158109.html

and README (lines 53-55):
http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/tree/README?h=un
stable-devel#n55

We built libdrm-armada + xf86-video-armada for Wandboard and it worked
fine.

In yocto project this package also was added:
https://lists.yoctoproject.org/pipermail/meta-freescale/2017-May/020566
.html

Lucas, could you please comment on whether libdrm-armada is necessary
for xf86-video-armada or not? Or just libdrm is enough.


> Regards,
> 
> Fabio Estevam
