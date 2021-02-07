From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:23:33 +0100
Subject: [Buildroot] [git commit] package/libcap: bump version to 2.48
Message-ID: <20210207091615.7F1AE807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dec9741a8fdae42136372f484c02515eed016f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sites.google.com/site/fullycapable/release-notes-for-libcap

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index b9beece902..7499f2468c 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  4ed3d11413fa6c9667e49f819808fbb581cd8864b839f87d7c2a02c70f21d8b4  libcap-2.46.tar.xz
+sha256  4de9590ee09a87c282d558737ffb5b6175ccbfd26d580add10df44d0f047f6c2  libcap-2.48.tar.xz
 
 # Hash for license file:
 sha256  088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 27a295cad7..d3a069e82a 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.46
+LIBCAP_VERSION = 2.48
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
