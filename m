From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Nov 2013 22:33:52 +0100
Subject: [Buildroot] [PATCH v2] netperf: enable demo mode.
In-Reply-To: <5277F6F8.4030500@mind.be> (Arnout Vandecappelle's message of
 "Mon, 04 Nov 2013 20:35:20 +0100")
References: <1383531561-5550-1-git-send-email-keguang.zhang@gmail.com>
 <5277F6F8.4030500@mind.be>
Message-ID: <87habrq2bj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/11/13 03:19, Kelvin Cheung wrote:
 >> Enable demo mode for netperf to activates a global "-D" <interval> option.
 >> This option will display interim results at least every time interval.
 >> 
 >> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >  On x86_64 with glibc, this makes a difference of 3K (<2%) on the
 > netperf and netserver executables. So I think it's OK to enable it
 > unconditionally.

Agreed. It is +4K here (uClibc, ARM).

-- 
Bye, Peter Korsgaard
