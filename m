From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Feb 2016 10:17:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-02-19
In-Reply-To: <20160221100114.591bd29e@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 21 Feb 2016 10:01:14 +0100")
References: <20160220073017.2A200101DA7@stock.ovh.net>
 <1455997702.5444.6.camel@embedded.rocks>
 <20160221000639.512d7658@free-electrons.com>
 <871t86cvak.fsf@dell.be.48ers.dk>
 <20160221100114.591bd29e@free-electrons.com>
Message-ID: <87si0mbey9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > (Not sure Peter will agree, since my proposal is not the cleanest
 >> > solution, but it's by far the one with the least impact.)
 >> 
 >> Yes, I agree - And preferably send the patch upstream as well!

 > Well, in essence, this patch will not be accepted upstream. It is a
 > crappy work-around for a compiler bug, so it would be very logical for
 > upstream to reject this patch.

Well, true - But presumably other Boost users may have affected
toolchains, so perhaps they do want to carry it to help people (I don't
know what the boost policy is, their "creative" C++ template code
probably triggers various other compiler bugs).

It's imho worth a try to send upstream.

-- 
Venlig hilsen,
Peter Korsgaard 
