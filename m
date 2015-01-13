From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Jan 2015 14:36:05 +0200
Subject: [Buildroot] [PATCH 1/3] botan: remove redundant INSTALL_TARGET
Message-ID: <b6614b5357753ff8a3580e80936d8fd19e0857bd.1421152567.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

INSTALL_TARGET defaults to YES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/botan/botan.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 9c41c9bd6941..27926a8f832d 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -11,7 +11,6 @@ BOTAN_LICENSE = BSD-2c
 BOTAN_LICENSE_FILES = doc/license.txt
 
 BOTAN_INSTALL_STAGING = YES
-BOTAN_INSTALL_TARGET = YES
 
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
-- 
2.1.4
