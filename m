From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 22:50:15 +0100
Subject: [Buildroot] [PATCH v3] connman: disable on avr32
In-Reply-To: <1383748703-15545-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 6 Nov 2013 14:38:23 +0000")
References: <1383748703-15545-1-git-send-email-spdawson@gmail.com>
Message-ID: <87a9hhkxns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The inotify_init1 syscall is not available on avr32. Fixes build failures
 > such as the following.

 >   http://autobuild.buildroot.net/results/0d8/0d8e7bd8bd3f227fabfb0d5feb59a5d316026d3f

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v3: Tidied up comment dependency, as suggested by Thomas De Schampheleire
 >  v2: Disable comment on avr32, as suggested by Thomas De Schampheleire

Committed, thanks.

-- 
Bye, Peter Korsgaard
