From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:54:25 -0300
Subject: [Buildroot] [PATCH] perf: fix typo and syntax error
Message-ID: <1413284065-20424-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/perf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perf/Config.in b/package/perf/Config.in
index 703b48f..083086b 100644
--- a/package/perf/Config.in
+++ b/package/perf/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_PERF
 
 	  This package builds and install the userspace 'perf'
 	  command. It is up to the user to ensure that the kernel
-	  configuration has all suitable options enable to allow a
+	  configuration has all the suitable options enabled to allow a
 	  proper operation of 'perf'.
 
 	  https://perf.wiki.kernel.org/
-- 
2.0.4
