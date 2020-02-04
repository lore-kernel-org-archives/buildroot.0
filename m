From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 09:33:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.25,
 add xtensa support
In-Reply-To: <ba2c8b6f-1ccb-b077-a789-cdbe2b987915@mind.be>
References: <20200201084758.285234-1-bernd.kuhls@t-online.de>
 <20200201102425.1556253b@windsurf>
 <ba2c8b6f-1ccb-b077-a789-cdbe2b987915@mind.be>
Message-ID: <20200204093351.6393df15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 4 Feb 2020 09:25:46 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > I don't feel very strongly about it, but I'm wondering if it doesn't
> > make sense to keep BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT. There is some
> > architecture-specific code in libnpsr, so every time we add a new CPU
> > architecture, we would have to poentially re-add this hidden option.  
> 
>  For what it's worth, I agree with doing that. We don't want to end up in the
> libffi situation...

Agreed. Though I don't think libnspr will ever be in the situation of
libffi, with zillions of reverse dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
