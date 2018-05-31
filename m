From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 May 2018 19:02:12 +0200
Subject: [Buildroot] [PATCH 1/1] libjpeg: use SPDX short identifier
Message-ID: <20180531170212.3231-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use IJG instead of jpeg-license

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjpeg/libjpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index edda2a5a1b..ab09881fc1 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -7,7 +7,7 @@
 LIBJPEG_VERSION = 9c
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
-LIBJPEG_LICENSE = jpeg-license (BSD-3-Clause-like)
+LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
 LIBJPEG_PROVIDES = jpeg
-- 
2.14.1
