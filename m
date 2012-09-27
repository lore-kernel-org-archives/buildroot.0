From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Sep 2012 10:30:32 +0200
Subject: [Buildroot] [PATCHv3 1/4] pkgconf: new package
In-Reply-To: <20120927102536.7729b853@skate>
References: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
 <50640642.8020407@mind.be> <20120927100912.6b623e39@skate>
 <50640C55.4070005@mind.be> <20120927102536.7729b853@skate>
Message-ID: <50640EA8.8010204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/12 10:25, Thomas Petazzoni wrote:
>> >     I haven't checked...  I just do a make -k during the night and see
>> >  what I need to fix in the morning.  I normally keep a log file but
>> >  that's already wiped.
> Ok. I'm wondering if we should be running allyespackageconfig builds in
> a regular fashion on the autobuild machines as well.

  No, I don't think it's worth it.  Random builds should trigger all packages
a couple of times per week, and they will capture dependency problems that
an allyespackageconfig doesn't.

  It would be useful if a report existed somewhere that lists each package and
gives the last time it was built successfully and failed.  That should tell us
if some packages are missed by the autobuilders.  Even better would be if this
is reported per autobuilder config, but that's probably too large to view.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
