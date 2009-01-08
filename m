From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Jan 2009 10:12:17 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090108082750.GD17480@zelow.no> (Thomas Lundquist's message of
	"Thu\, 8 Jan 2009 09\:27\:50 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
	<20090107184338.GA12169@zelow.no>
	<1231356377.32308.424.camel@elrond.atmel.com>
	<20090107202243.GA17480@zelow.no> <87mye2kgdt.fsf@macbook.be.48ers.dk>
	<20090108082750.GD17480@zelow.no>
Message-ID: <87d4eyrwjy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

 Thomas> On Wed, Jan 07, 2009 at 09:31:10PM +0100, Peter Korsgaard wrote:
 >> 
 >> comment "xorg requires a toolchain with LOCALE and WCHAR support"
 >> comment "iperf requires a toolchain with C++ support enabled"
 >> 
 >> And so on.

 Thomas> That's a comment, maybe make it a bit more in-the-face?

The comment is displayed in menuconfig - E.G.

 [ ] ifplugd
 [ ] irda_utils  --->
     *** iperf requires a toolchain with C++ support enabled ***
 [ ] iproute2

I find that pretty clear.

-- 
Bye, Peter Korsgaard
