From: Martin Bark <martin@barkynet.com>
Date: Wed,  3 Jun 2020 20:31:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/nghttp2: security bump version to
 1.41.0
Message-ID: <20200603193151.502850-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-11080 Denial of service: Overly large SETTINGS frames

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index e0512e891b..2a3ff2b5e2 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fc820a305e2f410fade1a3260f09229f15c0494fc089b0100312cd64a33a38c0  nghttp2-1.39.2.tar.gz
+sha256 eacc6f0f8543583ecd659faf0a3f906ed03826f1d4157b536b4b385fe47c5bb8  nghttp2-1.41.0.tar.gz
 sha256 6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 6a5ec72847..7b611c88fd 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.39.2
+NGHTTP2_VERSION = 1.41.0
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
-- 
2.26.2
