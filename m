From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  2 Apr 2017 00:36:27 +0530
Subject: [Buildroot] [PATCH 5/9] wpan-tools: correct license name
In-Reply-To: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491073591-21477-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491073591-21477-5-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iw license is ISC.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/wpan-tools/wpan-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpan-tools/wpan-tools.mk b/package/wpan-tools/wpan-tools.mk
index d223800..012b946 100644
--- a/package/wpan-tools/wpan-tools.mk
+++ b/package/wpan-tools/wpan-tools.mk
@@ -7,7 +7,7 @@
 WPAN_TOOLS_VERSION = 0.5
 WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
 WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
-WPAN_TOOLS_LICENSE = iw license
+WPAN_TOOLS_LICENSE = ISC
 WPAN_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
2.7.4
