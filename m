From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:31:05 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/nghttp2: security
 bump version to 1.41.0
Message-ID: <20200712212910.49ED9869AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94547c30d30821ce6ce995b19acb6b47724b578a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2020-11080 Denial of service: Overly large SETTINGS frames

Signed-off-by: Martin Bark <martin@barkynet.com>
[yann.morin.1998 at free.fr: two spaces in hash files]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e500367ea44adffcfc3132099bedf550d9913313)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nghttp2/nghttp2.hash | 4 ++--
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index e0512e891b..3702a91b5e 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fc820a305e2f410fade1a3260f09229f15c0494fc089b0100312cd64a33a38c0  nghttp2-1.39.2.tar.gz
-sha256 6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
+sha256  eacc6f0f8543583ecd659faf0a3f906ed03826f1d4157b536b4b385fe47c5bb8  nghttp2-1.41.0.tar.gz
+sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
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
