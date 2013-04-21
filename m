From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Apr 2013 23:31:34 +0200
Subject: [Buildroot] [PATCH] apf9328: Fix build error
In-Reply-To: <1365761213-26323-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Fri, 12 Apr 2013 12:06:53 +0200")
References: <1365761213-26323-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87ehe3fu4p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Commit a0b6faa ("gdb: convert to the package infrastructure") changed
 Maxime> the name of the host gdb configuration option, and added it to the
 Maxime> legacy option set, leading to a build breakage for the
 Maxime> armadeus_apf9328_defconfig.

Committed, thanks.

-- 
Bye, Peter Korsgaard
