From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu,  4 Jun 2020 14:33:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: bump to version 1.1.26
Message-ID: <20200604123333.24099-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index f49972e957..489188daf1 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1a69db028bf970f0dab15ed508b58e0cf0806a7e4492828404b75c97ec8ab306  libnetconf2-1.1.24.tar.gz
+sha256  2ce2b819f3544fd46a3a4c8ba6dd0a3798cab2a63aa347bc1eb5275a2c89b7bd  libnetconf2-1.1.26.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 4ef3d85b17..1b692550dc 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 1.1.24
+LIBNETCONF2_VERSION = 1.1.26
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.20.1
