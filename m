From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jul 2015 14:17:52 +0300
Subject: [Buildroot] [PATCH] olsr: update hash source comment
Message-ID: <28034039c3387104b8a19230eb131a043f9b96a8.1436872672.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ec9e34c9bb7c (olsr: bump version, 2015-07-14) update the hash but left
the old source comment. Fix this.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/olsr/olsr.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/olsr/olsr.hash b/package/olsr/olsr.hash
index 83c48e021de6..e14d52cd9ea2 100644
--- a/package/olsr/olsr.hash
+++ b/package/olsr/olsr.hash
@@ -1,2 +1,2 @@
-# From http://www.olsr.org/releases/0.6/SHA256SUM-0.6.8
+# From http://www.olsr.org/releases/0.9/SHA256SUM-0.9.0.2
 sha256	cc464b29c7740354d815d5faa753fd27c0677d71e8eb42e78abc382996892845 olsrd-0.9.0.2.tar.bz2
-- 
2.1.4
