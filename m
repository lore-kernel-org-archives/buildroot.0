From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 14 Nov 2008 10:52:26 +0100
Subject: [Buildroot] [PATCH] package: don't default to y for categories
In-Reply-To: <200811141021.18792.markus.heidelberg@web.de>
References: <200811132007.39723.markus.heidelberg@web.de>
	<200811140957.05585.markus.heidelberg@web.de>
	<20081114101003.5f1cb983@hcegtvedt>
	<200811141021.18792.markus.heidelberg@web.de>
Message-ID: <20081114105226.505aa98b@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Nov 2008 10:21:18 +0100
Markus Heidelberg <markus.heidelberg@web.de> wrote:

> Hans-Christian Egtvedt, 14.11.2008:
> > On Fri, 14 Nov 2008 09:57:05 +0100
> > Markus Heidelberg <markus.heidelberg@web.de> wrote:

<snipp>

> > A bit OT; the sub package selection directory should be selected
> > when you have a package selected beneath. That way you can not
> > disable compression stuff, when you have ZLIB selected by other
> > packages.
> 
> Damn, I see. So please forget the patch for now.
> 

It was more a remark about a general "bug" in the menu system generated
by kconfig now. Just look at the kernel, if you select a driver beneath
SPI, then you are not able to deselect the SPI category. I think we
should do the same with the kconfig in Buildroot.

-- 
Best regards,
Hans-Christian Egtvedt
