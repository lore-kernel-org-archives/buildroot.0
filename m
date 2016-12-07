From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 7 Dec 2016 09:27:43 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: search in the source
 directory for ltmain.sh
In-Reply-To: <20161207092228.1eb337c0@free-electrons.com>
References: <20161207070853.GA31889@waldemar-brodkorb.de>
 <20161207092228.1eb337c0@free-electrons.com>
Message-ID: <20161207082743.GE8584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Wed, 7 Dec 2016 08:08:54 +0100, Waldemar Brodkorb wrote:
> > Fixes static linking of berkeleydb package, where ltmain.sh
> > is not in the sub-directory that contains configure.
> > Always search the complete source directory.
> > 
> > Fixes:
> >  http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> It should be your SoB here, since you appear as the author of this
> patch, unless you "git format --amend --author=...".

So should I resend with my SoB and mention you in the log or
what is the correct way in this case, because the analysis was made
by me and the patch by you. I really don't care ;)
 
> > Tested-by: Waldema Brodkorb <wbx@openadk.org>
> 
> Your first name has changed? :-)

I thought it might be good idea to have a shorter name ;)

Don't sent patches before first coffee ;)

best regards
 Waldemar
