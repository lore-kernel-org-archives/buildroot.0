From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 00:13:06 +0100
Subject: [Buildroot] [PATCH] gpsd: switch to Git snapshot
In-Reply-To: <1386230902-10012-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 5 Dec 2013 08:08:22 +0000")
References: <1386230902-10012-1-git-send-email-spdawson@gmail.com>
Message-ID: <87y53ygad9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Since the gpsd version bump from 3.9 to 3.10, gpsd has been generating a lot
 > of autobuild failures. See, for example, the following.

 >   http://autobuild.buildroot.net/results/c8f/c8f2eed70cfbdcb7e7af820977aa531b59f0575a/

 > A 3.11 release is expected shortly; in the interim, switch to a recent Git
 > snapshot in which the most serious build problems appear to have been fixed.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
