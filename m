From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 15:58:26 +0100
Subject: [Buildroot] [PATCH v6 06/28] package/qwt: Add missing qt5svg
 dependency
In-Reply-To: <2c74699f-c4d5-d4ed-8c4f-16594484c6f6@andin.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-7-anaumann@ultratronik.de>
 <20200217225611.571c3eec@windsurf>
 <2c74699f-c4d5-d4ed-8c4f-16594484c6f6@andin.de>
Message-ID: <20200218155826.77de0986@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 10:43:17 +0100
Andreas Naumann <dev@andin.de> wrote:

> > This looks like a fix we should apply today. Why doesn't this trigger
> > any autobuilder failure?  
> 
> Probably because qwt is built after qt5svg (more or less by chance). 
> However, in per-package mode this becomes a problem because the libs are 
> not copied to the qwt per-package staging.

Ah yes, indeed. It's still a good bug fix that we can apply to master
now, independently of the rest of the series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
