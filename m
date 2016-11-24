From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 13:28:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: fixup enable host QEMU
 for powerpc64/powerpc64le
In-Reply-To: <20161124112013.6u5setqv4gc3m7pc@tarshish>
References: <a9e27a3340744ae0233852ec320e0039be8c828e.1479966991.git.sam.bobroff@au1.ibm.com>
 <20161124112013.6u5setqv4gc3m7pc@tarshish>
Message-ID: <20161124132859.5d50267e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 13:20:13 +0200, Baruch Siach wrote:

> On Thu, Nov 24, 2016 at 04:56:42PM +1100, Sam Bobroff wrote:
> > Fixes next commit d634d9dda7f3c328d63469cb628c79da49a09e89.
> > 
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > ---
> > Baruch,
> > 
> > I've rebased the patch onto next, I'm not sure what other changes to
> > make. Does it look OK now? (Will it get squashed in next?)  
> 
> The Buildroot maintainers do not rebase/amend next. When there is an issue 
> with an applied commit, either in next or master, post a but fix patch. Hence 
> the commit log should be more detailed. Also, you may mention the commit the 
> introduced the bug as you did, but not 'next'. The next branch will soon merge 
> into master, but the commit log will not change.

Sam: I thought your initial patch was not a bug fix, but a feature
addition, which is why I applied it to the "next" branch. However, I
see in the autobuilders failures of the host-qemu package for
powerpc64, and I believe those would be fixed by your patch. Could you
confirm it's the case? If it is, then I'll cherry-pick the original
patch (+ this additional fix) into the master branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
