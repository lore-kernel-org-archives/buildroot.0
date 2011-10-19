From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Oct 2011 11:35:52 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <1319011959.325.2.camel@sven>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <201110182339.00295.arnout@mind.be> <1319011959.325.2.camel@sven>
Message-ID: <201110191135.53268.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 19 October 2011 10:12:39, Sven Neumann wrote:
> On Tue, 2011-10-18 at 23:38 +0200, Arnout Vandecappelle wrote:
> 
> > > In a non-mandatory way it may be desirable.
> > > That is if a package doesn't define it then we don't care.
> > > Most of the time tarballs shouldn't change size & hash, though it 
> > > doesn't hold true for every project around.
> > 
> >  Size and hash should only change when you bump the version
> 
> Unfortunately it is not so uncommon for some projects to re-release with
> the same version number if a bug sneaked into the released tarball. I
> know that this should not be the case, but it happens every so often.
> 
> Not sure though what implications this has for the proposed buildroot
> changes...

 I guess that if we start with this feature, it should be limited to 
warnings for the first year or so until it proves its worth.

 The recent kernel.org horror has convinced me that some form of
verification is needed, though.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
