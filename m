From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 22:32:46 +0200
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.10
In-Reply-To: <1402673757-14223-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Fri, 13 Jun 2014 17:35:57 +0200")
References: <1402673757-14223-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87tx7oczyp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > Systemd needs a toolchain with kernel headers >= 3.10, as it needs
 > IFLA_VLAN_PROTOCOL from linux/if_link.h.

 > Fixes: http://autobuild.buildroot.net/results/33e/33e1447949d13bccc4076b69f902432e2131cc1c

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
