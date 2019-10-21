From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 21 Oct 2019 08:02:52 -0500
Subject: [Buildroot] [RFC PATCH v2 10/30] package/compiler-rt: new
 package
In-Reply-To: <dbe45821-d2e5-ae60-0302-daddd043c8d1@mind.be>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-11-michael.drake@codethink.co.uk>
 <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
 <dbe45821-d2e5-ae60-0302-daddd043c8d1@mind.be>
Message-ID: <CANQCQpbTyJXGWQWzcOqP02tu4XSQeKDm8D0JPdJHZDB_soF9_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, Oct 19, 2019 at 4:48 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
> On 17/10/2019 21:17, Matthew Weber wrote:
> > On Thu, Oct 17, 2019 at 10:30 AM Michael Drake
> > <michael.drake@codethink.co.uk> wrote:
> >> From: Matt Weber <matthew.weber@rockwellcollins.com>
> >>
> >> This patch adds support for the compiler-rt (CLANG runtime) library.
> >> It builds a set of static libraries and installs them into the
> >> CLANG/LLVM toolchain resource folder.
> >>
> > FYI, I plan to publish (soon) a cleaned up version of my original
> > series which add the compiler-rt feature.  That refreshed patchset
> > would have the feedback from my last series that's missing here.
>
>  There are probably interactions with Romain's clang series and Joseph's LLD
> series, so it would be nice if all of that could be combined in one series or at
> least ordered somewhat...
>

Agree, I'll get something together today ahead of the working meeting this week.

Right now, I've got a working copy pulling in Romain's series, however
its out of date with respect to current master.  Plus I need to review
Michael's reuse of compiler-rt and any changes.

Regards,
Matt
