From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:40 -0700
Subject: [Buildroot] [PATCH 01/11] jimtcl: define license
Message-ID: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/jimtcl/jimtcl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5c5cdb3..53cddf9 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -8,6 +8,8 @@ JIMTCL_VERSION = 0.73
 JIMTCL_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/jimtcl
 JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.bz2
 JIMTCL_INSTALL_STAGING = YES
+JIMTCL_LICENSE = BSD-2c
+JIMTCL_LICENSE_FILES = LICENSE
 
 JIMTCL_HEADERS_TO_INSTALL = \
 	jim.h \
-- 
1.7.4.1
