From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:43:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-12
In-Reply-To: <CANQCQpZFOf=0zsDVqim7R9MopGDuN6bvPOC1PNV_DO=cPXhm=Q@mail.gmail.com>
References: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
 <20190513135520.6ced2ff2@windsurf.home>
 <CANQCQpZFOf=0zsDVqim7R9MopGDuN6bvPOC1PNV_DO=cPXhm=Q@mail.gmail.com>
Message-ID: <20190514174305.4ee8da2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 May 2019 09:57:00 -0500
Matthew Weber <matthew.weber@collins.com> wrote:
> > > microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/e196d77626b877dc3454d21febe20a04877c02a9 |  
> >
> > Another weird timeout, this time on Matt's autobuilder. Matt, could you
> > have a look ?
> >
> > But this seems to happen quite regularly, even on other autobuilder
> > machines:
> >
> >   http://autobuild.buildroot.net/?reason=glibmm
> >
> > Always on microblazeel, like the timeout on "atop" discussed above. I
> > guess that probably points at a compiler issue, which means it should
> > be reproducible.
> >  
> 
> Build definitely hung (didn't even need to be on that build machine).
> I'll hopefully get some time to take a deeper look later.

I'd say most likely it's the same Microblaze issue than on atop, which
Giulio has been looking into, and which is in fact related to
BR2_TOOLCHAIN_HAS_GCC_BUG_85180.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
