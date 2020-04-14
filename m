From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 14 Apr 2020 10:17:15 +0200
Subject: [Buildroot] [PATCH 1/3] package/libnetconf2: bump to version 1.1.7
In-Reply-To: <20200414081717.4940-1-heiko.thiery@gmail.com>
References: <20200414081717.4940-1-heiko.thiery@gmail.com>
Message-ID: <20200414081717.4940-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Align hashes to the new spacing convention

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libnetconf2/libnetconf2.hash | 5 +++--
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 5cd9b99062..a73cb0ce91 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,2 +1,3 @@
-sha256 38e780cdd0135e9c7fe44b5190a1acc8c33cb28aa395c329893b019a57b1f783  libnetconf2-1.1.3.tar.gz
-sha256 085122ea91161812dda9cd2f42d8c50ecc3a48cc1a4f15044d86cfc5aa887577  LICENSE
+# Locally calculated
+sha256  35a1048754d6440674a193e4807b7cab5d03613b384436b67ef976ab3b1a2d01  libnetconf2-1.1.7.tar.gz
+sha256  085122ea91161812dda9cd2f42d8c50ecc3a48cc1a4f15044d86cfc5aa887577  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index bd25c69e0e..724e4993bb 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 1.1.3
+LIBNETCONF2_VERSION = 1.1.7
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.20.1
