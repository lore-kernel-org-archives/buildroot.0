From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 11:28:01 +0100
Subject: [Buildroot] [PATCH] libpfm4: disable on avr32
In-Reply-To: <1385717029-6381-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 29 Nov 2013 09:23:49 +0000")
References: <1385717029-6381-1-git-send-email-spdawson@gmail.com>
Message-ID: <87k3frwlhq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The perf_event_open syscall is not available on avr32. Fixes build failures
 > such as the following.

 >   http://autobuild.buildroot.net/results/38f/38fa81315be448c409b9af29f92621fcf5676f71/

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
