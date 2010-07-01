From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Jul 2010 09:15:46 +0200
Subject: [Buildroot] [git commit master 1/1] package/config: create
	.depend in object directory
In-Reply-To: <1277922133.2534.45.camel@dubciaranr1.verifone.com> (Quotient
	Remainder's message of "Wed, 30 Jun 2010 19:22:13 +0100")
References: <20100621210811.D9437817F1@busybox.osuosl.org>
	<1277922133.2534.45.camel@dubciaranr1.verifone.com>
Message-ID: <87fx03ad0d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Quotient" == Quotient Remainder <quotientvremainder@gmail.com> writes:

 Quotient> I get a (non-fatal) permission denied error when I do "make distclean"
 Quotient> and I've tracked it down to this change, I think.
 Quotient> It appears that $(obj) has an empty value when this is invoked.  I did
 Quotient> not do an out-of-tree build, btw.

Fixed, thanks.

-- 
Bye, Peter Korsgaard
