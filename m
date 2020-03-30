From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 30 Mar 2020 13:40:15 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: move cegui06 package to
 2020.05 section
Message-ID: <20200330114015.342650-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During package update, the legacy option was set to the existing
2020.02 release instead of the next 2020.05.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a9b2ead9d..63818ed6b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,8 +153,6 @@ config BR2_GCC_VERSION_5_X
 	  Support for gcc version 5.x has been removed. The current
 	  default version (8.x or later) has been selected instead.
 
-comment "Legacy options removed in 2020.02"
-
 config BR2_PACKAGE_CEGUI06
 	bool "BR2_PACKAGE_CEGUI06 was renamed"
 	select BR2_PACKAGE_CEGUI
@@ -163,6 +161,8 @@ config BR2_PACKAGE_CEGUI06
 	  The BR2_PACKAGE_CEGUI06 config symbol was renamed to
 	  BR2_PACKAGE_CEGUI.
 
+comment "Legacy options removed in 2020.02"
+
 config BR2_PACKAGE_JAMVM
 	bool "jamvm removed"
 	select BR2_LEGACY
-- 
2.26.0
