From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 14:34:09 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <CAAMH-ytVJUjhBkGTFoEMwVsOiRrEnXdSjtR45Xm6-qWkGH4OBw@mail.gmail.com>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
 <CAAMH-ytVJUjhBkGTFoEMwVsOiRrEnXdSjtR45Xm6-qWkGH4OBw@mail.gmail.com>
Message-ID: <20160809143409.26382cc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Aug 2016 14:25:40 +0200, Gary Bisson wrote:

> Actually I see in the defconfig that the external headers are 3.10
> which is the issue. This V4L2 format was added in 3.18.
> http://lxr.free-electrons.com/ident?v=3.10;i=V4L2_PIX_FMT_XRGB555X
> http://lxr.free-electrons.com/ident?v=3.18;i=V4L2_PIX_FMT_XRGB555X
> 
> I've submitted a patch to Carlos to fix that:
> https://github.com/Freescale/gstreamer-imx/pull/106

Great!

> I don't see any other error, there's an 'error' variable that isn't
> used but that's a warning.
> 
> I would wait for the change to be merged but if you want we can add
> that patch to the Buildroot package for now.

I'd prefer to add this patch to Buildroot now. I'm trying to reduce the
number of build issues, so any improvement can help.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
