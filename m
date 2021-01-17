From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 17 Jan 2021 22:37:14 +0100
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 1.2.6
Message-ID: <20210117213714.1336561-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thi patch bumps htpdate to version 1.2.6.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index b82b2bfa08..824266c1bc 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 267003ca4d5d191122bfd8f85a0fd2d0b7d751f7b04f5fde4e8f51e570c98d0b  htpdate-1.2.5.tar.gz
+sha256 d2cff522b8f53b00769dcca77d8025b19238ed35d702a4739dc05e387f718909  htpdate-1.2.6.tar.gz
 sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 7a08738d29..52022346a9 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.2.5
+HTPDATE_VERSION = 1.2.6
 HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.25.1
