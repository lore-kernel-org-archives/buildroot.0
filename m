From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Mar 2012 13:12:03 +0100
Subject: [Buildroot] [RFC] Request for comment for branch
	for-2012.05/misc-cleanups
In-Reply-To: <CAAXf6LXc+1QS5vr6JqLvJAYt0QHFYVetZF8E-hVqGioRMoDaHQ@mail.gmail.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <20120309143326.24a2b90e@skate>
 <CAAXf6LXc+1QS5vr6JqLvJAYt0QHFYVetZF8E-hVqGioRMoDaHQ@mail.gmail.com>
Message-ID: <201203101312.03747.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 09 March 2012 15:18:07 Thomas De Schampheleire wrote:
> On Fri, Mar 9, 2012 at 2:33 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > Le Fri, 9 Mar 2012 10:07:29 -0300,
> > Alexandre Pereira da Silva <aletes.xgr@gmail.com> a ?crit :
> >
> >> I think the pkg-* makefiles could be moved from the packages directory
> >> as they are used by the kernel and bootloaders as well.
> >> Maybe move them to the support directory.
> >
> > Yeah, I was also wondering about this. I don't know if support/ is the
> > right place, or if we need yet another top-level directory such as
> > include/ or mk/ or whatever. What are others opinion?
> 
> I don't think support/ is the right place, but I'm not against moving
> these files elsewhere.
> Not sure about the best name though...

 Many projects have a top-level 'mk' or 'make' directory for the common
make infrastructure.

 For me, however, support/mk sounds good as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
