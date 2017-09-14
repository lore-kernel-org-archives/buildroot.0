From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 14 Sep 2017 18:07:30 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2017.09-eng008
In-Reply-To: <20170914192057.701cd74c@windsurf>
References: <20170914163702.2316-1-abrodkin@synopsys.com>
 <20170914192057.701cd74c@windsurf>
Message-ID: <1505412449.3684.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2017-09-14 at 19:20 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this update. One question below though.
> 
> On Thu, 14 Sep 2017 19:37:02 +0300, Alexey Brodkin wrote:
> 
> > 
> > Now speaking about arc-2017.09 series it is built on top
> > of upstream GCC 7.1.1 and Binutils 2.29 so please expect
> > all kinds of breakages related to GCC 7.x as we saw earlier
> > with move from 4.8 to 6.x :)
> 
> If those new versions are now based on upstream gcc 7.x and binutils
> 2.29, why do we still use the Synopsys specific versions? Do you still
> have a large stack of patches on top of the upstream versions?

Well not that many now but indeed something not yet hit
upstream release or might have been released a bit late for the last relese
or even after.

Still thw next patch of mine will allow selection of upstream GCC and
Binutils for ARC.

So for now this GitHub-hosted stuff is more for safety. I.e. once we see
autobuilder is quite happy with upstream components we'll consider removal of
arc-XXX stuff completely. This won't happen in this release cycle nor
in the next I guess but in the course of the year I hope we'll be able to do it
[if all goes well].

-Alexey
