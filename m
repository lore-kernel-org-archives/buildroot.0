From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 13 Jan 2009 08:30:57 +0100
Subject: [Buildroot] samba doesn't build
In-Reply-To: <20090113071800.5c58bd6c@hcegtvedt>
References: <20090113044740.GA6321@cloud.net.au>
	<20090113071217.138459f9@hcegtvedt>
	<20090113061530.GA8121@cloud.net.au>
	<20090113071800.5c58bd6c@hcegtvedt>
Message-ID: <20090113083057.38518dfd@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Jan 2009 07:18:00 +0100
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:

> On Tue, 13 Jan 2009 17:15:30 +1100
> Hamish Moffatt <hamish@cloud.net.au> wrote:
> 
> > On Tue, Jan 13, 2009 at 07:12:17AM +0100, Hans-Christian Egtvedt
> > wrote:

<snipp>

> > > Huh? Then they have changed the 3.2.5 source code... I'll do a
> > > refresh of the Samba patches to see what's going on.
> > 
> > Here's the md5sum I have for the tarball;
> > 
> > 0f7539e09803ae60a2912e70adf1c747  ../../../sources/samba-3.2.5.tar.gz
> > 
> 
> I have the exactly same md5sum, weird.
> 

Aha, there was a patch in upstream Buildroot which I probably have
forgotten to remove some time ago.

> > I note that 3.2.7 is out now with more security fixes.
> > 
> 
> Okay, I will bump the version while I'm at it :)
> 

Done, could you give revision 24810 (or later) a spin?

-- 
Best regards,
Hans-Christian Egtvedt
