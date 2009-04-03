From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 3 Apr 2009 12:29:01 +1100
Subject: [Buildroot] [PATCH 2/5] mtd-utils: Added mtd-utils-1.2.0
In-Reply-To: <87d4bv5rw1.fsf@macbook.be.48ers.dk>
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
	<1238103279-8040-3-git-send-email-mroth@nessie.de>
	<20090402004150.GD29488@cloud.net.au>
	<87hc175yvt.fsf@macbook.be.48ers.dk> <49D48376.2060708@nessie.de>
	<87d4bv5rw1.fsf@macbook.be.48ers.dk>
Message-ID: <20090403012901.GA30190@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 02, 2009 at 11:25:34AM +0200, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:
> 
> Hi,
> 
>  Michael> Should the xxx-2005 and xxx-2006 snapshots of mtd-utils be
>  Michael> also removed?
> 
> Yes. They are marked as deprecated, and as I mentioned in the 2009.02
> annoucement [1], I *WILL* remove deprecated stuff to cleanup. We might
> as well do it now as in a few weeks.

There was some claim about Atmel data flash or something like that not being 
properly supported by more recent versions.. I don't know if that's
correct. The relevant people should be sending patches to the linux-mtd
folks I should think.

>  Michael> This will clean up a lot of special handling of different mtd-utils.

Yes.. if there was an mtd-utils release that included mkfs.ubifs, we
could scrub the multiple versions completely..


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
