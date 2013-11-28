From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 15:12:47 +0100
Subject: [Buildroot] [PATCH] connman: remove defunkt configuration
	options
In-Reply-To: <1385634265-16305-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 28 Nov 2013 10:24:25 +0000")
References: <1385634265-16305-1-git-send-email-spdawson@gmail.com>
Message-ID: <87fvqg1uow.fsf@dell.be.48ers.dk>
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

This conflicts with your ofone/neard patch. Care to rebase on top of
that and resend?

-- 
Bye, Peter Korsgaard
