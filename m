From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 May 2017 19:01:25 +0200
Subject: [Buildroot] [PATCH 3/6] qpid-proton: fix help text format
In-Reply-To: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
References: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1496163688-20870-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qpid-proton/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index 47cddebe9141..b49a2afa7eb4 100644
--- a/package/qpid-proton/Config.in
+++ b/package/qpid-proton/Config.in
@@ -6,10 +6,10 @@ config BR2_PACKAGE_QPID_PROTON
 	help
 	  The AMQP messaging toolkit
 
-	  Qpid Proton is a high-performance, lightweight messaging library.
-	  It can be used in the widest range of messaging applications,
-	  including brokers, client libraries, routers, bridges, proxies, and
-	  more.
+	  Qpid Proton is a high-performance, lightweight messaging
+	  library. It can be used in the widest range of messaging
+	  applications, including brokers, client libraries, routers,
+	  bridges, proxies, and more.
 
 	  https://qpid.apache.org/proton/
 
-- 
2.7.4
