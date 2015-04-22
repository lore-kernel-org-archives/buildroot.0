From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:08:36 +0200
Subject: [Buildroot] [PATCH v7 3/8] package/uclibc: add missing hash for
	eXtensa
In-Reply-To: <1429740521-31943-1-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
Message-ID: <1429740521-31943-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is a git snapshot, we can't have a hash for it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/uclibc.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 7bfe46f..729c643 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -6,3 +6,6 @@ sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-a
 
 # From http://www.uclibc-ng.org/trac/
 sha256  7e92e99995daa634cbdc63c297784df6e8fe39cc1d3bbd2d37eb5c3ced8a86e5        uClibc-ng-1.0.2.tar.xz
+
+# No hash for this git snapshot
+none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
-- 
2.1.4
