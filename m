From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 20 Jan 2020 10:12:54 +0100
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.34.1-1
In-Reply-To: <20200120091254.30207-1-joerg.krause@embedded.rocks>
References: <20200120091254.30207-1-joerg.krause@embedded.rocks>
Message-ID: <20200120091254.30207-3-joerg.krause@embedded.rocks>
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
index 1f1d65c3f9..388bba9ebd 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 25a34b2aecf02d1fd32352c855577dcecd20c756dee9eb7ebecd206bf1de26d3  luv-1.32.0-0.tar.gz
+sha256 e8267a65149a16ea279bc767c554b1441f8b52ec5ee48fe7d60b3f4106592aba  luv-1.34.1-1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 5723bc02e4..c1af508562 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.32.0-0
+LUV_VERSION = 1.34.1-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.25.0
