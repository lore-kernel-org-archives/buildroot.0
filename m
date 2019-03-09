From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 9 Mar 2019 16:04:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix static build with
 curl and libidn2
In-Reply-To: <20190309150920.343482ce@windsurf>
References: <20190308215200.11949-1-fontaine.fabrice@gmail.com>
 <20190309150920.343482ce@windsurf>
Message-ID: <CAPi7W82sCBSHs9tv9RvoaAvkNDN6qy=P9DNtbr-yPQ=km1GHbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le sam. 9 mars 2019 ? 15:09, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Fri,  8 Mar 2019 22:52:00 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/be5893b507d22a23951efeea20c18642742cef5a
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> As upstream replied in the pull request, the CMake FindCURL module
> already uses pkg-config if available. Could you investigate what this
> doesn't work as expected ?
Cmake does not use pkgconfig in FindCurl in any "official" versions
(including 3.13.4), they have added a call to pkgconfig only in
December 2018 with
https://github.com/Kitware/CMake/commit/fc5afbe97094d741b853b045d51351f3a370e87e#diff-62c4a3bc6680cd4945de9749af697a2a
I'll be a part of the upcoming 3.14.0.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
