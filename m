From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Feb 2012 11:45:59 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <201202071031.44299.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 7 Feb 2012 10:31:43 +0100")
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <201202070000.34270.arnout@mind.be>
 <8762fjt2m7.fsf@macbook.be.48ers.dk>
 <201202071031.44299.arnout@mind.be>
Message-ID: <87wr7ysyzc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I agree if possible, as that's one thing less to maintain.

 Arnout>  I think the main difference is that the mx5_defconfig includes
 Arnout> several BSPs, not just the loco.  So this custom one will
 Arnout> probably result in a (slightly) smaller kernel.

Which imho isn't a big priority for a defconfig (compared to the other
issues for maintenance overhead, platform/driver support included, ..)

-- 
Bye, Peter Korsgaard
