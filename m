From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 14:03:01 +0200
Subject: [Buildroot] [PATCH v4 10/11] package/mesa3d: enable OpenCL
 support
In-Reply-To: <e0869b48-09ec-54f4-5b77-3f086d9e636d@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-11-valentin.korenblit@smile.fr>
 <20180401233226.76803d73@windsurf>
 <e0869b48-09ec-54f4-5b77-3f086d9e636d@smile.fr>
Message-ID: <20180402140301.4fc4945f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Apr 2018 12:36:05 +0200, Valentin Korenblit wrote:

> > 	bool "OpenCL"
> >  
> >> +	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600  
> > This is certainly not really understanding how OpenCL works, but why do
> > you need this Gallium driver compiled in? Does the result only works on
> > a system with an AMD GPU ?  
> 
> Mesa's OpenCL implementation works only on AMD GPUs using Gallium Drivers.

OK. Maybe a comment on top of this dependency would make sense then,
and perhaps the commit title should be "enable OpenCL on AMD GPUs" or
something like that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
