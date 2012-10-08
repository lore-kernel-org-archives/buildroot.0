From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 22:34:02 +0200
Subject: [Buildroot] [PATCH] lcdproc: backport upstream patches
In-Reply-To: <1349422221-22971-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 5 Oct 2012 08:30:21 +0100")
References: <1349422221-22971-1-git-send-email-spdawson@gmail.com>
Message-ID: <87haq43dqd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Backport some lcdproc patches from upstream, to fix the following issues.

 spdawson>   * Incorrect parsing of minus key in handler for client_add_key command
 spdawson>   * Segfault in handler for menu_add_item command

Committed, thanks.

-- 
Bye, Peter Korsgaard
