From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  9 Jan 2016 13:43:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/tremor: bump to revision 19427
Message-ID: <1452343407-7638-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The revision 18153 dates from 2012-01-20. Lets update to latest changed revision
19427 which dates from 2015-01-07.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/tremor/tremor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 590a18c..97b0ce3 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -6,7 +6,7 @@
 
 TREMOR_SITE = http://svn.xiph.org/trunk/Tremor
 TREMOR_SITE_METHOD = svn
-TREMOR_VERSION = 18153
+TREMOR_VERSION = 19427
 TREMOR_LICENSE = BSD-3c
 TREMOR_LICENSE_FILES = COPYING
 
-- 
2.6.4
