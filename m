From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 19:26:30 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nghttp2: bump
 version to 1.37.0
Message-ID: <20190925175412.36A0A8F445@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cbc9a3ff465947a49bce9aba789549138efc841
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd52cb76b050ceb4566982c7cb6001358ebf188d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
