From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Sep 2017 21:11:20 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2017.09-eng008
In-Reply-To: <1505412449.3684.5.camel@synopsys.com>
References: <20170914163702.2316-1-abrodkin@synopsys.com>
 <20170914192057.701cd74c@windsurf>
 <1505412449.3684.5.camel@synopsys.com>
Message-ID: <20170914211120.6817efa7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Sep 2017 18:07:30 +0000, Alexey Brodkin wrote:

> > If those new versions are now based on upstream gcc 7.x and binutils
> > 2.29, why do we still use the Synopsys specific versions? Do you still
> > have a large stack of patches on top of the upstream versions?  
> 
> Well not that many now but indeed something not yet hit
> upstream release or might have been released a bit late for the last relese
> or even after.
> 
> Still thw next patch of mine will allow selection of upstream GCC and
> Binutils for ARC.
> 
> So for now this GitHub-hosted stuff is more for safety. I.e. once we see
> autobuilder is quite happy with upstream components we'll consider removal of
> arc-XXX stuff completely. This won't happen in this release cycle nor
> in the next I guess but in the course of the year I hope we'll be able to do it
> [if all goes well].

Fair enough. As long as it is in your plans to switch to use the
upstream gcc/binutils at some point in the not too distant future, I'm
fine with keeping an ARC-specific gcc version and binutils version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
