From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Nov 2013 12:21:19 +0100
Subject: [Buildroot] [PATCH v5] uclibc: reinstate support for version
	0.9.31
In-Reply-To: <1383816289-4899-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 7 Nov 2013 09:24:49 +0000")
References: <1383816289-4899-1-git-send-email-spdawson@gmail.com>
Message-ID: <87li10ihjk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > This patch reinstates support for uClibc version 0.9.31, which was removed
 > from Buildroot in commit 8abb5b33c1aae035cf48b1c81104b433ff884c64

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v5: Various improvements suggested by Peter Korsgaard, including a reduction
 >      of the 0.9.31 uClibc patch set
 >  v4: As suggested by Thomas Petazzoni, make 0.9.31 avr32-only, and disable
 >      other uClibc versions for avr32
 >  v3: Rebase on top of current master
 >  v2: Resend original RFC patch, no changes

Committed, thanks.

-- 
Bye, Peter Korsgaard
