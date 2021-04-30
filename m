From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Apr 2021 22:55:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xorgproto: bump version to
 2021.4
Message-ID: <20210430205537.682528-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.x.org/archives/xorg-announce/2021-April/003085.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xorgproto/xorgproto.hash | 6 +++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 11d8b214ac..a88c129dd0 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-February/003073.html
-sha256  4c732b14fc7c7db64306374d9e8386d6172edbb93f587614df1938b9d9b9d737  xorgproto-2021.3.tar.bz2
-sha512  3965e8f7f9fbfb2ad8c315865e112e2743915e6b9669fb1ee9bdd376fe4dce0145d547c679a321763b3eaa54832c7a92ff627f36505e914d2a4c48c2246a800e  xorgproto-2021.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-April/003085.html
+sha256  0f5157030162844b398e7ce69b8bb967c2edb8064b0a9c9bb5517eb621459fbf  xorgproto-2021.4.tar.bz2
+sha512  0d905e5f135daf7005e23371cbdc41a62d99567e0a20784e71ead0092ffd1e7582733819f7198add1d97edcc9aa80012ae01d2be8367280d69b41d0c25349367  xorgproto-2021.4.tar.bz2
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 7e157103a4..59f0640241 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2021.3
+XORGPROTO_VERSION = 2021.4
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
-- 
2.29.2
