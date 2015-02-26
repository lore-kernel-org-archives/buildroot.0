From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 26 Feb 2015 19:01:44 +0100
Subject: [Buildroot] [PATCH] package/libsrtp: fix static build only
In-Reply-To: <54EF5140.8060208@imgtec.com>
References: <1424906225-11543-1-git-send-email-romain.naour@openwide.fr>
 <54EF2D49.8060909@imgtec.com> <54EF5140.8060208@imgtec.com>
Message-ID: <54EF5F88.6050104@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

upstream fixed the problem. Could you please backport this patch instead
of adding your own?

https://github.com/cisco/libsrtp/commit/b5fad5f893c7f323a8f8e1c512fa48cf6cdb1c8d

This way we can remove it in the next version bump.

Regards,
--
Vincent
