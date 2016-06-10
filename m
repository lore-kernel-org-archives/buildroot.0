From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Fri, 10 Jun 2016 23:56:16 +0300
Subject: [Buildroot] [PATCH RESEND] Bump linux kernel and u-boot versions
In-Reply-To: <20160610201759.0907abc5@free-electrons.com>
References: <1465566116-28333-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20160610201759.0907abc5@free-electrons.com>
Message-ID: <1465592176.2815.11.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-06-10 at 20:17 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 10 Jun 2016 16:41:56 +0300, Eugeniy Paltsev wrote:
> > 
> > Update kernel version to the most recent stable as of today 4.6.2
> > with back-ported ARC PGU support from 4.7-rc2.
> > 
> > Bump u-boot to 2016.05 release.
> > Add 1 u-boot patch to disable IOC.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>
> This version does not use 4.7-rc2, and still have zillions have patches
> due to this. And the commit log therefore doesn't match what the patch
> is doing.

Looks like you misunderstood that patch.
It was tagged with "RESEND" because its first version was discarded by mailman
since Eugeniy was not subscribed. So he really just re-sent exactly the same patch
so it will show up in the mailing list.

That said respin with real kernel 4.7-rc3 (which I think will be cut early next week)
we'll be sending next week.

Anyways sorry for the noise.

-Alexey
