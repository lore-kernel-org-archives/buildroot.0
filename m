From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:09:08 +0100
Subject: [Buildroot] [PATCH 32/33] rrdtool: add license info
In-Reply-To: <CAHXCMM+pc8K8BUG7TcVBr5Q+-LYy2KLFNSgs7vkPTsOhLsVptA@mail.gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-33-git-send-email-s.martin49@gmail.com>
 <20121122051744.GA10958@sapphire.tkos.co.il>
 <CAHXCMM+pc8K8BUG7TcVBr5Q+-LYy2KLFNSgs7vkPTsOhLsVptA@mail.gmail.com>
Message-ID: <50B12964.4030803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 11:07, Samuel Martin wrote:
> Hi Baruch, all,
>
> 2012/11/22 Baruch Siach<baruch@tkos.co.il>:
> > Hi Samuel,
> >
> > On Thu, Nov 22, 2012 at 01:18:22AM +0100, Samuel Martin wrote:
> >>
> >> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> >> ---
> >>   package/rrdtool/rrdtool.mk | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
> >> index 8799a85..4392b50 100644
> >> --- a/package/rrdtool/rrdtool.mk
> >> +++ b/package/rrdtool/rrdtool.mk
> >> @@ -6,6 +6,9 @@
> >>
> >>   RRDTOOL_VERSION = 1.2.30
> >>   RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
> >> +RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
> >> +RRDTOOL_LICENSE_FILES = COPYING
> >
> > Shouldn't COPYRIGHT also be listed with the license files?
> The Copyright file just tells us "wrt the license, you can do that and
> that, but not that with this software",
> with some real use case.
>
> Shall we consider as part of the license files?

  Since you refer to it in the RRDTOOL_LICENSE, yes the COPYRIGHT file
should be included.

  Note that "GPLv2+ with exceptions" is probably enough, since the
user should anyway look at COPYRIGHT to find out the details.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
