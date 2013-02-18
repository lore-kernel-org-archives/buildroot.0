From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Feb 2013 22:32:42 +0100
Subject: [Buildroot] [PATCH] busybox: support millisecond watchdog
	periods
In-Reply-To: <1361183911-2672-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 18 Feb 2013 10:38:31 +0000")
References: <1361183911-2672-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ppzxi9z9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> The BusyBox watchdog application supports reset periods
 spdawson> specified in milliseconds. The Buildroot package will only
 spdawson> allow an integer reset period, which prevents the use of the
 spdawson> required "ms" suffix. Change the watchdog period
 spdawson> configuration item to a string, to allow the use of the "ms"
 spdawson> suffix.

Committed, thanks.

-- 
Bye, Peter Korsgaard
