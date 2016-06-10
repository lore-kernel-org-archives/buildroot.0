From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Jun 2016 13:51:56 +0000
Subject: [Buildroot] [PATCH] Bump linux kernel and u-boot versions
In-Reply-To: <20160610154548.3843b19b@free-electrons.com>
References: <1465564039-21759-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20160610154548.3843b19b@free-electrons.com>
Message-ID: <1465566668.2942.44.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-06-10 at 15:45 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 10 Jun 2016 16:07:19 +0300, Eugeniy Paltsev wrote:
> > 
> > Update kernel version to the most recent stable as of today 4.6.2
> > with back-ported ARC PGU support from 4.7-rc2.
> What about using 4.7-rc2 directly? By the time the next Buildroot
> release will be made, the final 4.7 will have been released, so you
> will have the opportunity to adjust the defconfig to use the final 4.7.
> 
> But at least, in the mean time, we don't have to carry huge patches in
> Buildroot, especially feature patches (like the display controller
> driver), which we don't like to carry in Buildroot.

Right, that might be a good idea.
I should have thought about that myself but I was thinking in terms
of releases for some reason...

So I think we'll do a respin indeed.

-Alexey
