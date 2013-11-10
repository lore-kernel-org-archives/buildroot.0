From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 10:06:39 +0100
Subject: [Buildroot] [PATCH] avr32: fix uclibc build using recent kernel
	headers
In-Reply-To: <1383903723-7705-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 8 Nov 2013 09:42:03 +0000")
References: <1383903723-7705-1-git-send-email-spdawson@gmail.com>
Message-ID: <87d2m8eicg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Using kernel headers newer than 3.6.x, uclibc 0.9.31.1 fails to build:

Committed, thanks.

-- 
Bye, Peter Korsgaard
