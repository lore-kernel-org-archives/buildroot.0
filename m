From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 May 2014 10:10:09 +0200
Subject: [Buildroot] host-pkgconf: use --static option for static builds
In-Reply-To: <53641563.5020903@mind.be>
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140408035851.GK4096@tarshish> <20140501124909.GX4531@tarshish>
 <53625154.7030701@imgtec.com> <53641563.5020903@mind.be>
Message-ID: <20140505101009.268bc9a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 03 May 2014 00:00:03 +0200, Arnout Vandecappelle wrote:
> On 01/05/14 15:51, Vicente Olivert Riera wrote:
> > I was talking with ThomasP about the same thing. He told me that it has huge
> > consequences and can't be committed easily, because it affects how almost all
> > packages are built in a BR2_PREFER_STATIC_LIB=y build.
> 
>  That's a bit a strange argument... If it doesn't get committed, it will never
> be tested. We have a month to fix autobuilder failures, that should be enough, no?

Well, it would at least be good to have a preliminary testing with a
fairly large set of packages enabled, in a BR2_PREFER_STATIC_LIB=y
configuration, to check that things are still working OK after applying
this patch. Not a 100% coverage, but at least testing a few dozens of
packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
