From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 09:34:15 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: search in the source
 directory for ltmain.sh
In-Reply-To: <20161207082743.GE8584@waldemar-brodkorb.de>
References: <20161207070853.GA31889@waldemar-brodkorb.de>
 <20161207092228.1eb337c0@free-electrons.com>
 <20161207082743.GE8584@waldemar-brodkorb.de>
Message-ID: <20161207093415.1170a5e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Dec 2016 09:27:43 +0100, Waldemar Brodkorb wrote:

> > On Wed, 7 Dec 2016 08:08:54 +0100, Waldemar Brodkorb wrote:  
> > > Fixes static linking of berkeleydb package, where ltmain.sh
> > > is not in the sub-directory that contains configure.
> > > Always search the complete source directory.
> > > 
> > > Fixes:
> > >  http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da
> > > 
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> > 
> > It should be your SoB here, since you appear as the author of this
> > patch, unless you "git format --amend --author=...".  
> 
> So should I resend with my SoB and mention you in the log or
> what is the correct way in this case, because the analysis was made
> by me and the patch by you. I really don't care ;)

Actually, the change itself was proposed by Arnout, and I just tested
it quickly.

Just put you as the author, I really don't care for such a simple
change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
