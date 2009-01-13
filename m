From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 13 Jan 2009 07:18:00 +0100
Subject: [Buildroot] samba doesn't build
In-Reply-To: <20090113061530.GA8121@cloud.net.au>
References: <20090113044740.GA6321@cloud.net.au>
	<20090113071217.138459f9@hcegtvedt>
	<20090113061530.GA8121@cloud.net.au>
Message-ID: <20090113071800.5c58bd6c@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Jan 2009 17:15:30 +1100
Hamish Moffatt <hamish@cloud.net.au> wrote:

> On Tue, Jan 13, 2009 at 07:12:17AM +0100, Hans-Christian Egtvedt
> wrote:
> > On Tue, 13 Jan 2009 15:47:40 +1100
> > Hamish Moffatt <hamish@cloud.net.au> wrote:
> > 
> > > Hi,
> > > 
> > > samba bumped to 3.2.5 doesn't build -
> > > samba-use-unsigned-enums.patch doesn't apply.
> > > 
> > > It looks like upstream has applied this patch already?
> > > 
> > 
> > Huh? Then they have changed the 3.2.5 source code... I'll do a
> > refresh of the Samba patches to see what's going on.
> 
> Here's the md5sum I have for the tarball;
> 
> 0f7539e09803ae60a2912e70adf1c747  ../../../sources/samba-3.2.5.tar.gz
> 

I have the exactly same md5sum, weird.

> I note that 3.2.7 is out now with more security fixes.
> 

Okay, I will bump the version while I'm at it :)

PS! Excellent use of the non existing MAINTAINER file ;)

-- 
Best regards,
Hans-Christian Egtvedt
