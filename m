From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 May 2015 07:14:12 +0300
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig
 and bootable microSD Bash script
In-Reply-To: <alpine.DEB.2.11.1505290930060.2289@tanhuma.tkos.co.il>
References: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
 <20150529044005.GM2260@tarshish>
 <alpine.DEB.2.11.1505290930060.2289@tanhuma.tkos.co.il>
Message-ID: <20150531041412.GB2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Fri, May 29, 2015 at 09:56:25AM +0300, Jonathan Ben Avraham wrote:
> On Fri, 29 May 2015, Baruch Siach wrote:
> >On Thu, May 28, 2015 at 04:36:10PM +0300, Jonathan Ben-Avraham wrote:
> >>+# @(#) Create a bootable SD card from Buildroot tree for the HummingBoard 
> >>i2eX
> >>+#
> >>+# Copyright (c) 2015 Tk Open Systems Ltd. all rights reserved
> >>+# License granted for public use under the terms of the "Attribution-ShareAlike
> >>+# 4.0 International" license, See full text at
> >>+# https://creativecommons.org/licenses/by-sa/4.0/legalcode
> >
> >Buildroot code itself is under GPLv2. See
> >http://nightly.buildroot.org/manual.html#_complying_with_the_buildroot_license.
> >Is this license GPLv2 compatible?
>
> Regarding the use of the CC SA license, it seems to me that if there are
> packages using the MIT and BSD licenses in Buildroot then the CC AS license
> should be Ok also.
> 
> If you want to claim that there is a difference between packages that are
> downloaded and contributions that are part of Buildroot itself, then I would
> say that the difference between GPLv2 and CC SA for a Bash script - which is
> not compiled and cannot be linked against, is not significant.
> 
> I prefer to use the CC licenses, because they  are simpler, clearer, and
> more appropriate to configuration files and scripts which are not compiled
> or linked against, and they avoid both the heavy RMS idealogical baggage and
> the legal confusions associated with the GPL licenses without any loss of
> rights to the public.

The fact that all of Buildroot code itself is released under GPLv2 should make 
life easier for downstream Buildroot distributors (and their legal 
departments).

Anyway, in case Buildroot maintainers agree to accept scripts under a 
different license, please add a patch to section 12.3 of the manual to clarify
Buildroot license.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
