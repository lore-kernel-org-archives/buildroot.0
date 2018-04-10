From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 20:55:16 +0200
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180410171826.GF19381@momiji>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>
 <87po3t21cy.fsf@dell.be.48ers.dk>
 <20180410095327.59c0e9d8@windsurf> <20180410165409.GD19381@momiji>
 <20180410175738.40345498@windsurf> <20180410171826.GF19381@momiji>
Message-ID: <20180410205516.0b7958bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 17:18:26 +0100, Adrian Perez de Castro wrote:

> > Then the following paragraph that you wrote:
> > 
> >    This series starts with the same three patches as the previous
> >    submission, and adds on top three additional commits to make
> >    WebKitGTK+ available on AArch64 (it's a platform we support
> >    upstream), and adds a couple of patches which are already merged in
> >    the upstream repository, but are not in the release and are worth
> >    applying.
> > 
> > is a bit unclear. You're saying "adds on top three additional commits
> > to make WebKitGTK+ available on AArch6". What those three additional
> > commits ?
> > 
> > For the record, your patch series was:
> > 
> >   brotli: new package
> >   woff2: new package
> >   webkitgtk: update to version 2.20.0
> >   webkitgtk: Add upstream patch for better memory monitoring  
> 
> Ah, right: first I thought of making a separate patch for the small change
> of marking as available on AArch64. That, plus one commit for the upstream
> build fix, plus one commit for the upstream memory monitor patch. The first
> I ended up stashing with ?webkitgtk: update to version 2.20.0?, and the other
> two are not going to be needed for 2.20.1 (they were merged upstream).

OK, thanks for the clarification.

> Sorry if I wasn't being very clear here O:-)
> 
> If you think enabling the package for AArch64 deserves its own separate
> commit, let me know and I'll split it back. FWIW, I've been trying AArch64
> builds for the RaspberryPi 3, and they work fine; we also use them at work
> for a couple of clients as well without issues.

I think it's OK to enable on AArch64 at the same time as you do the
bump. It could be done in separate commits (each change stands on its
own), but I'm fine with those changes being in the same commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
