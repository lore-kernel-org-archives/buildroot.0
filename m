From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 1 Jan 2016 16:52:44 +0200
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <20151230235323.3f11d1ea@free-electrons.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
 <20151230160016.14524b1f@free-electrons.com>
 <56844F79.3080903@mind.be>
 <20151230225333.171a6c4c@free-electrons.com>
 <56845669.3050005@mind.be>
 <20151230235323.3f11d1ea@free-electrons.com>
Message-ID: <20160101145244.GA29643@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wed, Dec 30, 2015 at 11:53:23PM +0100, Thomas Petazzoni wrote:

> >  So I think now we can safely conclude that a hash file should be added for all
> > packages, even if it just contains 'none' hashes. It is definitely an advantage
> > to be able to distinguish packages that should still get a hash from packages of
> 
> Agreed.

Ok, got it.

Does it make sense to update the file name in .hash, or is it ok to leave it as is
since it's not used anyway?  It's (version).tar.gz now but the git checkout gets saved
as vboot-utils-(version).tar.gz.
