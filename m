From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Tue,  5 Dec 2017 15:36:50 +0000
Subject: [Buildroot] [PATCH v2 1/1] glorytun: adapt to the coding style
Message-ID: <20171205153650.27531-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/glorytun/glorytun.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index eadeda9540..81b45c4da8 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -1,3 +1,9 @@
+################################################################################
+#
+# glorytun
+#
+################################################################################
+
 GLORYTUN_VERSION = 0.0.93-mud
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium
-- 
2.15.1
