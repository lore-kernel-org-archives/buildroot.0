From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:44:58 +0200
Subject: [Buildroot] [PATCH] sna/dri2: Protect compsiteext.h include
 with build check
In-Reply-To: <20140718232336.GA5940@bwidawsk.net>
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
 <1405665634-3299-1-git-send-email-chris@chris-wilson.co.uk>
 <20140718232336.GA5940@bwidawsk.net>
Message-ID: <20140723234458.7399f7b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ben Widawsky,

On Fri, 18 Jul 2014 16:23:37 -0700, Ben Widawsky wrote:
> On Fri, Jul 18, 2014 at 07:40:34AM +0100, Chris Wilson wrote:
> > We shouldn't include calls to the composite extension if it has not been
> > built.
> > 
> > Reported-by: Ben Widawsky <ben@bwidawsk.net>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> This patch does not apply cleanly to .912. The wiggled patch does build.
> With my earlier patch reverted.
> 
> If this patch will be in .913, and .913 is coming relatively soon, we
> can ignore this entirely for buildroot and simply do a version bump to
> .913 when its available.

I'm sorry, but I don't understand your comment. Your patch was against
Buildroot, but you say it doesn't apply against .912, which is a
version of the intel driver. Could you explain a bit more if your
patches http://patchwork.ozlabs.org/patch/371342/ and
http://patchwork.ozlabs.org/patch/371343/ are still applicable?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
