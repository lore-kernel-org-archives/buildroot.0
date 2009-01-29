From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 20:04:15 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
In-Reply-To: <1233253891.4147.51.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Thu\, 29 Jan 2009 19\:31\:31 +0100")
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk>
	<1233005366.2298.118.camel@elrond.atmel.com>
	<871vup4ul9.fsf@macbook.be.48ers.dk>
	<1233008389.2298.129.camel@elrond.atmel.com>
	<87vds114op.fsf@macbook.be.48ers.dk>
	<FE6DCE243B7A4724B6B33E85771AD61F@aeglos>
	<871vumtb1w.fsf@macbook.be.48ers.dk>
	<A223C54B106543948AC36303E7C74F76@aeglos>
	<8763jyrtfb.fsf@macbook.be.48ers.dk>
	<69C4B5A4F9B74F77AE1E58B4F020A786@aeglos>
	<87skn2qch5.fsf@macbook.be.48ers.dk>
	<1233253891.4147.51.camel@elrond.atmel.com>
Message-ID: <87fxj2q6hc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> No, but we're doing a bunch of cleanups now - And as I mentioned before,
 >> the arch-arm directory seems a bit extreme as it is.

 Ulf> I much prefer that we avoid doing this under time pressure
 Ulf> and come to an agreememt on how to do a good implementation
 Ulf> after the first release.

Ok, but I guess we can atleast remove the support for 2.6.21.1 (as
there's 2.6.21.5) and 2.6.26-rc3 (as there's 2.6.26) ?

 >> I don't think adding a bunch of special case handling to buildroot to
 >> download AT91 patches from somewhere is a better solution. We should
 >> rather generalize the setup so you can handle it outside BR and just
 >> point BR to a repo or a directory full of patches.
 >> 

 Ulf> I am for generic solutions, but not at the expense of ease of use.
 Ulf> That is why it needs some pondering, before a solution is selected.

I'm not for ease of use over everything else, it also has to be
manageable for the developers - But yes, the easier we can make it to
use at the same time, the better.

-- 
Bye, Peter Korsgaard
