From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Dec 2013 11:17:56 +0100
Subject: [Buildroot] [PATCH v2] udev: disable on avr32
In-Reply-To: <1386236381-18778-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 5 Dec 2013 09:39:41 +0000")
References: <1386236381-18778-1-git-send-email-spdawson@gmail.com>
Message-ID: <87y53zha97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > udev requires the epoll_create1 system call, which is not available on avr32.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v2: Fix system/Config.in too, as suggested by Arnout Vandecappelle

Committed, thanks.

-- 
Bye, Peter Korsgaard
