From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 12:21:07 +0100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131203221437.106b6bf5@kryten>
References: <20131202172311.2641462e@kryten> <20131202110923.2ac86fb5@skate>
 <20131203221437.106b6bf5@kryten>
Message-ID: <20131203122107.66e5ba4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Blanchard,

On Tue, 3 Dec 2013 22:14:37 +1100, Anton Blanchard wrote:
> 
> Hi Thomas,
> 
> > Can you add to the commit log the specific toolchain/situation for
> > which this is needed? The external toolchain logic is full of special
> > cases, and I very often read the commit logs to find out why such or
> > such special case was added.
> 
> Definitely. How does this look?

Perfect. Can you just resubmit just the patch (without this discussion
above it), so that our patchwork picks up a good version of it, that
the BR maintainer can apply?

Also, just curious, are you actually using Buildroot for ppc64 or s390x
machines?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
