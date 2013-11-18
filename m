From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Nov 2013 10:03:51 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: disable e4defrag on avr32
In-Reply-To: <1384763418-2695-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 18 Nov 2013 08:30:18 +0000")
References: <1384763418-2695-1-git-send-email-spdawson@gmail.com>
Message-ID: <871u2exers.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The fallocate syscall is not available on avr32. This is needed by the e4defrag
 > utility, so we disable this on avr32.

 > Fixes build failures such as the following.

 >   http://autobuild.buildroot.net/results/dcb/dcb4e5c6981a9299a2eb18e325d4de621846afdb/

Committed, thanks.

-- 
Bye, Peter Korsgaard
