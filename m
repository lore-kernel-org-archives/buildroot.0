From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 May 2015 10:18:13 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
 3.10.17-1.0.1
In-Reply-To: <CAAMH-yu_i+bdN_+Tp8VLfbq5cE=nyOD5ULfNcx1fhg9rfbm0Kw@mail.gmail.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <20150511132307.GA21085@kwain>
 <CAAMH-yvrDWD5Sgi1d=YTxqVMQfDNHHdoyx94izA8eX3mz4woeQ@mail.gmail.com>
 <1754040.vn4Oi7W8vI@sagittea>
 <CAAMH-yu_i+bdN_+Tp8VLfbq5cE=nyOD5ULfNcx1fhg9rfbm0Kw@mail.gmail.com>
Message-ID: <20150512101813.3c62cb3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Tue, 12 May 2015 09:56:10 +0200, Gary Bisson wrote:

> > Since this package seems to be incompatible with kernels < 3.10.54, maybe we
> > should provide imx-gpu-viv AND gpu-viv-bin-mx6q, no?
> 
> Well the gpu-viv-bin-mx6q is only good for 3.10.17 whereas the new
> imx-gpu-viv apparently works for both 3.10.53 and 3.14.28. Also most
> of the kernels offered by manufacturers are now 3.10.53 or above. But
> let's consider the option, wouldn't it be a headache for packages that
> depend on it such as gst1-imx or xdriver_xf86-video-imx-viv? I guess
> it'd need to check on the kernel headers versions to know which
> package it depends on.

We could use a virtual package, but it indeed seems to be too much of
an headache. If the new version of the i.MX6 GPU drivers support both
3.10.53 and 3.14.28, then I think we should package just this latest
version. People running 3.10.17 should upgrade :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
