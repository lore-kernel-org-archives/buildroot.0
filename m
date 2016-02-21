From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Feb 2016 09:38:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-02-19
In-Reply-To: <20160221000639.512d7658@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 21 Feb 2016 00:06:39 +0100")
References: <20160220073017.2A200101DA7@stock.ovh.net>
 <1455997702.5444.6.camel@embedded.rocks>
 <20160221000639.512d7658@free-electrons.com>
Message-ID: <871t86cvak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Yes, it is really a work-around, but it is so much simpler than adding
 > a BR2_TOOLCHAIN_HAS_GCC_BUG_58952, selecting it for all broken
 > toolchain + adding the autobuilder exceptions that are needed to also
 > exclude the custom external toolchains that are affected.

 > (Not sure Peter will agree, since my proposal is not the cleanest
 > solution, but it's by far the one with the least impact.)

Yes, I agree - And preferably send the patch upstream as well!

-- 
Bye, Peter Korsgaard
