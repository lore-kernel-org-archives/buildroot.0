From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Aug 2012 06:54:47 +0300
Subject: [Buildroot] [PATCH 2/3] mxml: add license information
In-Reply-To: <5019908D.7080205@lucaceresoli.net>
References: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
 <9e9f83eae727c218f9ee7cfc2a7d86772a12a308.1343796460.git.baruch@tkos.co.il>
 <20120801201023.05c53086@skate> <5019908D.7080205@lucaceresoli.net>
Message-ID: <20120802035447.GA6153@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca, Thomas,

On Wed, Aug 01, 2012 at 10:24:45PM +0200, Luca Ceresoli wrote:
> Thomas Petazzoni wrote:
> >Le Wed,  1 Aug 2012 07:48:58 +0300,
> >Baruch Siach <baruch@tkos.co.il> a ?crit :
> >
> >>+MXML_LICENSE = LGPLv2+
> >>+MXML_LICENSE_FILES = COPYING
> >
> >I haven't applied this one, because the situation is a bit more
> >complicated here. mxml is released under LGPLv2+ + some special
> >exceptions. See the COPYING file:

[snip]

> >I am not sure how to encode this into the _LICENSE field. Luca?
> 
> Well, the fallback for fancy licenses is "<package_name> license", as in
> "bzip2 license", for example.
> 
> But in cases like this, where the license is very similar to a well-known
> one, I would prefer something like "LGPLv2+ with exceptions".That is much
> more informative, while still clearly stating this not equal to an LGPLv2+.

Ok. I'll resubmit the patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
