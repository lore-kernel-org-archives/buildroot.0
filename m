From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 10:33:40 +0100
Subject: [Buildroot] [PATCH v2] toolchain: update crosstool-NG project URL
Message-ID: <1364117620-6181-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7edf82b..f1cca14 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -28,7 +28,7 @@ config BR2_TOOLCHAIN_CTNG
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
-	  ( http://ymorin.is-a-geek.org/projects/crosstool )
+	  (http://crosstool-ng.org).
 
 	  This is considered experimental, and you can expect some breakage.
 
-- 
1.7.9.5
