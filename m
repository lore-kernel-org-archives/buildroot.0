From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 17:16:00 +0100
Subject: [Buildroot] [PATCH v2] connman: remove defunkt configuration
	options
In-Reply-To: <1385648695-28899-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 28 Nov 2013 14:24:55 +0000")
References: <1385648695-28899-1-git-send-email-spdawson@gmail.com>
Message-ID: <87pppkzem7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > We are carrying support for a couple of configuration options which
 > are no longer present in connman. Specifically:
 > ; threads: vestigial configuration option needed for defunkt WiMAX plugin
 > ; ntpd: plugin no longer present in connman

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v2: Rebase on top of next branch

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
