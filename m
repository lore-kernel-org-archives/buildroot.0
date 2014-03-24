From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Mar 2014 15:27:35 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: needs kernel headers >= 3.0
In-Reply-To: <1395666568-21604-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Mon, 24 Mar 2014 14:09:28 +0100")
References: <1395666568-21604-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87zjkfsmco.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > Systemd requires at least Linux headers 3.0 because it uses:
 > - setns(2) syscall, introduced in 3.0.
 > - IFLA_GROUP from if_link.h, introduced in 2.6.39.

 > Fixes http://autobuild.buildroot.net/results/098/09866da023d527b3c228a98f1fde104e780e1883/

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
