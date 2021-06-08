From: Edmundo Ferreira <fc.edmundo@gmail.com>
Date: Tue,  8 Jun 2021 22:24:34 +0200
Subject: [Buildroot] [PATCH 31/35] package/x265: fixes SITE since upstream
 repo was moved
Message-ID: <20210608202434.10092-1-edmundo.ferreira@esa.int>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Edmundo Ferreira <fc.edmundo@gmail.com>

Signed-off-by: Edmundo Ferreira <fc.edmundo@gmail.com>
---
 package/x265/x265.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 872753eea8..2704360626 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -6,7 +6,7 @@
 
 X265_VERSION = 3.3
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
-X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
+X265_SITE = https://bitbucket.org/multicoreware/x265_git/downloads
 X265_LICENSE = GPL-2.0+
 X265_LICENSE_FILES = COPYING
 X265_CPE_ID_VENDOR = multicorewareinc
-- 
2.31.1
