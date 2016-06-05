From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:03:11 +0200
Subject: [Buildroot] [git commit] package/open-plc-utils: bump version
Message-ID: <20160605200530.F115881E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dabee52da3e68f36950561da389cdfa5c32c247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open-plc-utils/open-plc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index a674372..67c8d7d 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 05ef40c0a2949cfaf1c3230e10679fbcf912d174
+OPEN_PLC_UTILS_VERSION = 1be781d1ea81827e5f6c1a35961c65dd4d15472c
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3c
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
