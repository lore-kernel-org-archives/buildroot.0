From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 May 2013 22:50:05 +0200
Subject: [Buildroot] [PATCH] Remove spurious POST_UNINSTALL hook usage
In-Reply-To: <1368993492-7353-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 19 May 2013 20:58:12 +0100")
References: <1368993492-7353-1-git-send-email-spdawson@gmail.com>
Message-ID: <87mwrhea9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> A couple of patches make use of
 spdawson> XXX_POST_UNINSTALL_TARGET_HOOKS, which is not a hook set that
 spdawson> Buildroot actually supports.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
