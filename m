From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 21:29:02 +0100
Subject: [Buildroot] [PATCH v2 0/2] systemd/udev/eudev polishing
In-Reply-To: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Mon, 24 Feb 2014 10:25:40 +0100")
References: <1393233942-11638-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87lhwzhr75.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This patch series contains enhancements for systemd, udev and eudev, intended
 > for next branch:

 > - use of proper virtual package infrastructure (suggested by Arnout).
 > - enable required kernel features for systemd (suggested by SamuelM).

 > Changes v1 -> v2:
 >  - reworked systemd help text (suggested by ThomasP).
 >  - removed shell commands in virtual package infra (suggested by ThomasP).

Committed both to next, thanks.

-- 
Bye, Peter Korsgaard
