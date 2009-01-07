From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 7 Jan 2009 19:43:38 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231268970.32308.230.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no>
	<87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no>
	<873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
Message-ID: <20090107184338.GA12169@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 06, 2009 at 08:09:30PM +0100, Ulf Samuelsson wrote:
> 
> A typical issue that pops up from time to time is that
> people build the toolchain with a certain configuration
> and then finds that they need a different configurtion
> to build a package, and do not realize that they 
> need to rebuild the toolchain for the changes to take effect.

Which is why...

> It would be good to resolve this, and this is why I have
> proposed to separate toolchain build.

..This is a bad idea.

(Since the rebuild should be automagic if there are 
 changes in configurations that requires one.)

> With SYSROOT in gcc-4 there is really no reason 
> to induce people to rebuild the toolchain,
> and we might want to support downloading a binary toolchain as well.

The only way to support this should be through the "external toolchain" 
thingie. (And that should have it's own maintainer, one that uses this)


Thomas
