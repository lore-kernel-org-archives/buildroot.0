From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 19 Sep 2015 23:33:50 +0200
Subject: [Buildroot] [PATCH 2/2] package/liblinear: wrap help text to fit 72
	columns
In-Reply-To: <1442698430-18748-1-git-send-email-joerg.krause@embedded.rocks>
References: <1442698430-18748-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1442698430-18748-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/liblinear/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index 17c5a74..f25c119 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBLINEAR
 	bool "liblinear"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  liblinear is a linear classifier for data with millions of instances and
-	  features.
+	  liblinear is a linear classifier for data with millions of instances
+	  and features.
 
 	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
 
-- 
2.5.3
