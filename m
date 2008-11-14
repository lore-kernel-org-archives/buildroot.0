From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 14 Nov 2008 10:21:18 +0100
Subject: [Buildroot] [PATCH] package: don't default to y for categories
In-Reply-To: <20081114101003.5f1cb983@hcegtvedt>
References: <200811132007.39723.markus.heidelberg@web.de>
	<200811140957.05585.markus.heidelberg@web.de>
	<20081114101003.5f1cb983@hcegtvedt>
Message-ID: <200811141021.18792.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt, 14.11.2008:
> On Fri, 14 Nov 2008 09:57:05 +0100
> Markus Heidelberg <markus.heidelberg@web.de> wrote:
> 
> > Arnar Mar Sig, 13.11.2008:
> > > How about creating new categories for the packages on the main  
> > > "package selection for target" page?
> > > 
> > > Personally I thing there are way to many package on the main page
> > > and I'm board of always scolling thru it to.
> > 
> > That's what I think, too. Some more order would be nice. I also find
> > the scrolling quite annoying.
> > 
> 
> A bit OT; the sub package selection directory should be selected when
> you have a package selected beneath. That way you can not disable
> compression stuff, when you have ZLIB selected by other packages.

Damn, I see. So please forget the patch for now.

Markus
