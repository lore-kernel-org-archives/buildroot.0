From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 09:50:02 +0100
Subject: [Buildroot] BR-2009.02-rc3 Make Error (./makedepend: 1: Syntax
	error: Unterminated quoted string)
In-Reply-To: <1233865636.4148.8.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 05 Feb 2009 21\:27\:16 +0100")
References: <BAY124-DS4F2AA8AFF4C9516A055FDD2C20@phx.gbl>
	<87d4dyck50.fsf@macbook.be.48ers.dk>
	<1233865636.4148.8.camel@elrond.atmel.com>
Message-ID: <87wsc49cg5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> I don't use perl, but it seems from the above like Ulf's r25032 might
 >> have gotten the file case wrong - It talks about x2p/Makefile but is
 >> then trying to sed x2p/makefile. Could you try changing the $(SED)
 >> line in package/microperl/microperl.mk to use x2p/Makefile?
 >> 

 Ulf> IIRC, there is both a makefile and a Makefile, and it should be applied
 Ulf> to makefile.

Ok, it seems to build for me - E.G. I cannot reproduce the problem.

-- 
Bye, Peter Korsgaard
