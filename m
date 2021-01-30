From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 30 Jan 2021 22:40:29 +0100
Subject: [Buildroot] [PATCH 2/4] package/libnetconf2: bump version to 1.1.36
In-Reply-To: <20210130214028.26398-1-heiko.thiery@gmail.com>
References: <20210130214028.26398-1-heiko.thiery@gmail.com>
Message-ID: <20210130214028.26398-3-heiko.thiery@gmail.com>
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
index 489188daf1..a20e31e8d3 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2ce2b819f3544fd46a3a4c8ba6dd0a3798cab2a63aa347bc1eb5275a2c89b7bd  libnetconf2-1.1.26.tar.gz
+sha256  17aa551380ffcccc3bfd928edbcc170cbe85b0f336b361d5f03ede8f3e5f6348  libnetconf2-1.1.36.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 1b692550dc..770188df91 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 1.1.26
+LIBNETCONF2_VERSION = 1.1.36
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.20.1
