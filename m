From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 12 Jun 2008 13:43:06 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
References: <20080611161156.33737116@crazy><46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com><20080611154121.GI3795@mx.loc><20080612052146.GE12527@cloud.net.au>
	<20080612111315.GB13098@mx.loc>
Message-ID: <045201c8cc8a$a4c1b310$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To: <buildroot@uclibc.org>
Sent: Thursday, June 12, 2008 1:13 PM
Subject: Re: [Buildroot] Still no answer for a contribution made in March


> On Thu, Jun 12, 2008 at 03:21:46PM +1000, Hamish Moffatt wrote:
>>On Wed, Jun 11, 2008 at 05:41:21PM +0200, Bernhard Fischer wrote:
>>> On Wed, Jun 11, 2008 at 11:08:49AM -0400, John Voltz wrote:
>>> >Hi Thomas,
>>> >
>>> >I would have expected Ulf to take care of your patch since he usually
>>> >handles most of the ARM stuff. I've noticed that one of the important
>>> >methods of working with free software is to be able to make the changes
>>> >directly yourself. So I would email Erik for subversion access, and drop it
>>> >in there myself.
>>> 
>>> Yea, and that's the reason why the svn-repo is completely fux0red up.
>>
>>What reason? How does that follow?
> 
> Many reasons. Ask yourself if you use proper flags, to name just the
> most visible one. But even apart from that there are numerous, just for
> example, random picks:
> http://buildroot.uclibc.org/lists/buildroot/2007-September/005051.html

Yes, you broke the AT91 ARM build (which depends on ATMEL_MIRROR),
by making the ATMEL_MIRROR definition dependent on using the AVR32 architecture.
That is why the patch was reverted.

You may be right on the others.

> http://buildroot.uclibc.org/lists/buildroot/2008-January/006696.html
> http://buildroot.uclibc.org/lists/buildroot/2008-February/006971.html
> http://buildroot.uclibc.org/lists/buildroot/2008-April/007981.html
> http://buildroot.uclibc.org/lists/buildroot/2008-April/008480.html
> http://buildroot.uclibc.org/lists/buildroot/2008-April/008494.html
> etc, etc
> _______________________________________________


Best Regards
Ulf Samuelsson
