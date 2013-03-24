From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 22:16:18 +0100
Subject: [Buildroot] [PATCH 1/1] Fix autoreconf libtool patching
In-Reply-To: <1363846182-6178-1-git-send-email-przemyslaw.wrzos@calyptech.com>
 (Przemyslaw Wrzos's message of "Thu, 21 Mar 2013 17:09:42 +1100")
References: <1363846182-6178-1-git-send-email-przemyslaw.wrzos@calyptech.com>
Message-ID: <87obe8h525.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Przemyslaw" == Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com> writes:

 Przemyslaw> From: przemyslaw <przemyslaw.wrzos@calyptech.com>
 Przemyslaw> Some ltmain.sh files enclose the version number in quotes. This is
 Przemyslaw> already handled corretly by pkg-autotools.mk in LIBTOOL_PATCH_HOOK.
 Przemyslaw> This patch adds the same fix for AUTORECONF_HOOK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
