From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  1 Jun 2019 12:43:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/luv: bump to version 1.29.1-1
In-Reply-To: <20190601104344.12469-1-joerg.krause@embedded.rocks>
References: <20190601104344.12469-1-joerg.krause@embedded.rocks>
Message-ID: <20190601104344.12469-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index e6e47b0d5e..507299f9df 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d7eca8a9d7f126ed478fa76ce6a4e5d6e9f79309ddbceaae01060f4edc6bf242  luv-1.28.0-1.tar.gz
+sha256 430d5d8ad6b22e3e6284b8cdcfc7cea93e7459039bc12375a8a89bfbd034751c  luv-1.29.1-1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 084311a761..d1f7b06e85 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.28.0-1
+LUV_VERSION = 1.29.1-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.21.0
