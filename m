From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 01:02:04 +0100
Subject: [Buildroot] [PATCH] libhid: disable on avr32
In-Reply-To: <1351963254-17491-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 3 Nov 2012 18:20:54 +0100")
References: <1351963254-17491-1-git-send-email-arnout@mind.be>
Message-ID: <87d2zuw803.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> libhid uses timerfd, which is not yet available in the uClibc-0.9.31
 Arnout> that we have to rely on for avr32.  Since this is pretty much a corner
 Arnout> case, just disable libhid for avr32.

Committed, thanks.

-- 
Bye, Peter Korsgaard
