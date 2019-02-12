From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 12 Feb 2019 21:42:30 +0100
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.16.3
Message-ID: <20190212204230.27913-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since 1.16.2:
  - Makefile.am: don't use relative paths for include
  - keytable: do not install bpf protocols decoders with execute permission

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libv4l/libv4l.hash | 4 ++--
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 2b01c1a713..231a471b9e 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.2.tar.bz2.asc
-sha256 6c3208c9a1c73455d30bae83096d161e57bec5008594f270a2a67df8c86d8e47  v4l-utils-1.16.2.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.3.tar.bz2.asc
+sha256 7c5c0d49c130cf65d384f28e9f3a53c5f7d17bf18740c48c40810e0fbbed5b54  v4l-utils-1.16.3.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 71011d9102..fe1ffbcf5d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.16.2
+LIBV4L_VERSION = 1.16.3
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.20.1
