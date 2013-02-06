From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 13:37:31 -0300
Subject: [Buildroot] [PATCH] ser2net: add license information
Message-ID: <1360168651-5336-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ser2net/ser2net.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index d2c3270..e4ad340 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -7,5 +7,7 @@
 SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net/$(SER2NET_VERSION)
+SER2NET_LICENSE = GPLv2+
+SER2NET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.12.4
