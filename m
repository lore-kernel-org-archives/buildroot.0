From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Feb 2013 09:20:30 -0300
Subject: [Buildroot] [PATCH] iw: switch upstream site
Message-ID: <1359980430-11982-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's moved from wireless.kernel.org to generic kernel.org

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 22ea25c..9233833 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -6,7 +6,7 @@
 
 IW_VERSION = 3.8
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
-IW_SITE = http://wireless.kernel.org/download/iw
+IW_SITE = http://www.kernel.org/pub/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
-- 
1.7.12.4
