From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Sep 2014 13:58:23 +0300
Subject: [Buildroot] [PATCH] stress: update homepage link
Message-ID: <51bc4d2f87aef02cd78e60e06f6b1a9c4bc9c449.1411556303.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old link returns HTTP 404 error.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/stress/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stress/Config.in b/package/stress/Config.in
index 37f8946c2af0..b22c3f19bb50 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_STRESS
 	  It imposes a configurable amount of CPU, memory, I/O, and
 	  disk stress on the system.
 
-	  http://weather.ou.edu/~apw/projects/stress/
+	  http://people.seas.harvard.edu/~apw/stress/
-- 
2.1.0
