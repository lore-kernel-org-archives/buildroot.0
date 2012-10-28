From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 28 Oct 2012 13:47:26 +0100
Subject: [Buildroot] [PATCH 1/1] libxml2: bump version to 2.9.0
Message-ID: <1351428446-14828-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


libxml: bump version to 2.9.0
Many bug fixes and improvements.
Visit http://www.xmlsoft.org/news.html for more details.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libxml2/libxml2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index b63200f..91042fa 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBXML2_VERSION = 2.8.0
+LIBXML2_VERSION = 2.9.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
-- 
1.8.0
