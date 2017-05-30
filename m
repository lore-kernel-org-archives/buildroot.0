From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:20:07 +0200
Subject: [Buildroot] [git commit] qpid-proton: fix help text format
Message-ID: <20170530212121.88EB382A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbd29d0ad454328bcdb450d6ada423e7f5cb3b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qpid-proton/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qpid-proton/Config.in b/package/qpid-proton/Config.in
index 47cddeb..b49a2af 100644
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
 
