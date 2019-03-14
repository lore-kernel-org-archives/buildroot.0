From: Martin Bark <martin@barkynet.com>
Date: Thu, 14 Mar 2019 13:38:12 +0000
Subject: [Buildroot] [PATCH 2/3] package/nghttp2: bump version to 1.37.0
In-Reply-To: <20190314133813.727-1-martin@barkynet.com>
References: <20190314133813.727-1-martin@barkynet.com>
Message-ID: <20190314133813.727-3-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index d000fd56c5..a56f56f222 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f75e8f228217f23aa5eabfbab140e061cda00b7c21e34c891ecfb248d663303f  nghttp2-1.32.0.tar.gz
+sha256 760981ab5703d3ed185eccb322321d379453974357a3263971a928c2879a43bf  nghttp2-1.37.0.tar.gz
 sha256 6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 20bfee75a3..7ce28b41fc 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.32.0
+NGHTTP2_VERSION = 1.37.0
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
-- 
2.21.0
