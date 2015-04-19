From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 19 Apr 2015 18:57:44 +0200
Subject: [Buildroot] [PATCH] uclibc: update hash for arc
In-Reply-To: <5533DC18.7030907@mind.be>
References: <5533DC18.7030907@mind.be>
Message-ID: <1429462664-15469-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old hash for 2014.08 was never updated. Since uclibc-arc-2014.12 is
downloaded from the github helper, it is converted into a 'none' hash.

Reordered the hashes so the none-hashes are together.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This should be inserted into Yann's series before or after 3/7.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/uclibc.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 971ab26..01e71c0 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,11 +1,11 @@
 # Locally calculated after checking pgp signature
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
-# Locally calculated
-sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
-
 # From http://www.uclibc-ng.org/trac/
 sha256  e561040293ba4f21dcf3285ca1f683b5a8493eb0ffd3b3e495122cfde5a64a0e        uClibc-ng-1.0.1.tar.xz
 
+# No hash for the ARC variant, comes from the github-helper
+none	xxx	uClibc-arc-2014.12.tar.gz
+
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
-- 
2.1.4
