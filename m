From: Richard Braun <rbraun@sceen.net>
Date: Thu, 14 Feb 2013 15:32:37 +0100
Subject: [Buildroot] [PATCH] linux: add option to get sources from
 custom directory
In-Reply-To: <50D0AA87.7010404@mind.be>
References: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
 <20121212105418.601702fc@skate>
 <20121212101407.GA9848@mail.sceen.net> <50D0AA87.7010404@mind.be>
Message-ID: <20130214143237.GA3826@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 18, 2012 at 06:40:23PM +0100, Arnout Vandecappelle wrote:
> On 12/12/12 11:14, Richard Braun wrote:
> >On Wed, Dec 12, 2012 at 10:54:18AM +0100, Thomas Petazzoni wrote:
> >>On the other side, Linux, and bootloaders, are kind of special packages
> >>in that very often people will have to work on them, and making this
> >>easier might be useful.
> >
> >The fact that the kernel is clearly separate from the other packages in
> >menuconfig, and that it already provides several ways of fetching the
> >source makes it hard for most people to think of the override mechanism.
> >On the other hand, the fact that it's handled almost like any other
> >package makes this hack extremely easy and safe to implement. I don't
> >see a reason not to provide this fetching method if the others aren't
> >also reconsidered (otherwise I wouldn't have bothered sending it
> >anyway).
> 
>  I agree. I think that if we provide several methods of downloading
> in the menuconfig, then all SITE_METHODs should ideally be
> supported. In particular svn is probably also of interest to some
> people.

Ping.

-- 
Richard Braun
