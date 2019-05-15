From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 May 2019 16:17:05 +0200
Subject: [Buildroot] [PATCH 1/1] linux: xenomai: use URL for the
 ADEOS/IPIPE patch
In-Reply-To: <1091_1557929413_5CDC1DC5_1091_391_1_20190515141011.GA12386@r-lnx-nyma7486-2>
References: <20190515090251.20668-1-sebastien.szymanski@armadeus.com>
 <20190515160029.1e85d845@windsurf>
 <1091_1557929413_5CDC1DC5_1091_391_1_20190515141011.GA12386@r-lnx-nyma7486-2>
Message-ID: <20190515161705.53ce0ba0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 May 2019 16:10:11 +0200
<yann.morin@orange.com> wrote:

> > > +ifneq ($(XENOMAI_ADEOS_PATCH_URL),)
> > > +XENOMAI_ADEOS_PATCH = $(shell basename $(XENOMAI_ADEOS_PATCH_URL))  
> > You can use $(basename ...) instead of $(shell basename ...)  
> 
> I think you meant $(notdir ...)
> 
> $(basename ...) does not seem to do what you seem to think it would do.

Gah, indeed. Thanks for fixing my too-quick answer on this point :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
