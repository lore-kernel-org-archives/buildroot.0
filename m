From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2021 13:09:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdvbsi: bump version to 0.3.9
Message-ID: <20210207120931.1209966-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to github, removed md5 hash, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvbsi/libdvbsi.hash | 9 ++-------
 package/libdvbsi/libdvbsi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/libdvbsi/libdvbsi.hash b/package/libdvbsi/libdvbsi.hash
index 184da52866..5f731a1908 100644
--- a/package/libdvbsi/libdvbsi.hash
+++ b/package/libdvbsi/libdvbsi.hash
@@ -1,8 +1,3 @@
-# From http://www.saftware.de/libdvbsi++/libdvbsi++-0.3.8.tar.bz2.md5
-md5	c8e6ef55ef4b96dacdee250779219d2a  libdvbsi++-0.3.8.tar.bz2
-
 # Locally calculated
-sha256 a5b3fa767aa45267178c169268df886b3e79431f335a24d779edf610e8372f89 libdvbsi++-0.3.8.tar.bz2
-
-# Hash for license file:
-sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	COPYING
+sha256  a57949b842d94efedd895f2bd8e483c9f258e698092e35f1c3fdccb45b790953  libdvbsi++-0.3.9.tar.bz2
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index d1646c0efd..65191b81ad 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBDVBSI_VERSION = 0.3.8
+LIBDVBSI_VERSION = 0.3.9
 LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
-LIBDVBSI_SITE = http://www.saftware.de/libdvbsi++
+LIBDVBSI_SITE = https://github.com/mtdcr/libdvbsi/releases/download/$(LIBDVBSI_VERSION)
 LIBDVBSI_INSTALL_STAGING = YES
 LIBDVBSI_LICENSE = LGPL-2.1
 LIBDVBSI_LICENSE_FILES = COPYING
-- 
2.29.2
