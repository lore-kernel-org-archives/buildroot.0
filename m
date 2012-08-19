From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 19 Aug 2012 21:08:41 +0100
Subject: [Buildroot] [PATCH 1/4] yajl: add license information
Message-ID: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/yajl/yajl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 6c4278e..9cebeb7 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -7,5 +7,7 @@
 YAJL_VERSION = 2.0.4
 YAJL_SITE = git://github.com/lloyd/yajl.git
 YAJL_INSTALL_STAGING = YES
+YAJL_LICENSE = ISC
+YAJL_LICENSE_FILES = COPYING
 
 $(eval $(cmake-package))
-- 
1.7.9.5
