From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jan 2014 23:35:08 +0100
Subject: [Buildroot] [PATCH v6 1/5] sysvinit: depend on SysV selected as
	init system.
In-Reply-To: <1389627907-7821-2-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Mon, 13 Jan 2014 16:45:02 +0100")
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <8761pnzf1f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > In order to prevent sysvinit and systemd to be selected at the same
 > time, sysvinit can now only be selected if SysV is chosen as init
 > system.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
