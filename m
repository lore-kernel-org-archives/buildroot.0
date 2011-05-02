From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 2 May 2011 17:47:34 +0200
Subject: [Buildroot] [PATCH 1/2] package: add jimtcl support
In-Reply-To: <20110502084427.3990412d@surf>
References: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
	<87vcxuv2c6.fsf@macbook.be.48ers.dk>
	<20110501164314.GE1212@game.jcrosoft.org>
	<87ei4iux8y.fsf@macbook.be.48ers.dk>
	<20110502054115.GH1212@game.jcrosoft.org>
	<20110502084427.3990412d@surf>
Message-ID: <20110502154734.GK1212@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08:44 Mon 02 May     , Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 2 May 2011 07:41:15 +0200
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:
> 
> > > That should work today - E.G. the git support creates a tarball
> > > which will be reused next time you build or can be put on a mirror
> > > server.
> > The idea is to use the tree directly and not everytime create a
> > tarball
> 
> That's something I plan to add globally at the package infrastructure
> level. We need it for many other packages as well, for example the
> bootloaders or the kernel. So there's infrastructure work to be done to
> implement this, but I'd prefer to wait this work to be done rather than
> cluttering each independent package with this kind of specific handling.
> 
> My idea is that users could write a "local.mk" file, in which they
> could do:
> 
> JIMTCL_OVERRIDE_SRCDIR = /my/own/location
> 
> and Buildroot will use /my/own/location as the sources for JIMTCL.
For now I'll post a patch to allow scm mirrors

Personnaly I use this alot I've a gitosis with mirror of all my componet I
work on so I can easly update them and reclone them quickly
I do the same on Mercurial
or svn via git tree

Best Regards,
J.
