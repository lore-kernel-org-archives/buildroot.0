From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 02 Feb 2013 14:46:13 +0100
Subject: [Buildroot] [PATCH] avr32: support uClibc 0.9.33.2
In-Reply-To: <1358718941-25383-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 20 Jan 2013 21:55:41 +0000")
References: <1358718941-25383-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ip6a7rru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> Add a uClibc patch from OpenWRT, and tweak an existing patch
 spdawson> to cope with the lack of a dup3 Linux syscall on avr32. This
 spdawson> allow uClibc 0.9.33.2 to be built for avr32.

I've added the upstream URL for the openwrt patch and committed, thanks.

-- 
Bye, Peter Korsgaard
