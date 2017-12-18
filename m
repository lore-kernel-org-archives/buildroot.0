From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:46:59 +0100
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.89
Message-ID: <20171218095730.05A887F9AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427225d993b91c4b187e7377d8e24b4cc29624ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 87fdc89..0842411 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-November/156682.html
-md5 fe4d5c77f1468ee73d0bbb30d76945d7  libdrm-2.4.88.tar.bz2
-sha1 9cac721d33eb1e65a89a764cb71a7a63ceb6d7c1  libdrm-2.4.88.tar.bz2
-sha256 b5e55dbac2124e742e639f5b8553e8b7395863bf73dab4f77e99fe2fc25572b5  libdrm-2.4.88.tar.bz2
-sha512 0d9d4bcc0d9be1fb6b1ca075339b22b0f927288a4c02bbcbf95406b5c095051890f3d2e0d32e529ef9b6952ce1250afd1e0765ad3188c2bac924dda8c33afabb  libdrm-2.4.88.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-December/160530.html
+md5 5307a147dde67ac643f6753a42b5d32c  libdrm-2.4.89.tar.bz2
+sha1 43123da26271df9a29deb687c1855bef3fed249c  libdrm-2.4.89.tar.bz2
+sha256 629f9782aabbb4809166de5f24d26fe0766055255038f16935602d89f136a02e  libdrm-2.4.89.tar.bz2
+sha512 380e4e46cd3971a73264bd1b482791fab0503268adb65ac81b674df009662cfb8ef5741e362f19670b2a43b1c46f022d857706c9a4bebed2b1cddaa317b7706d  libdrm-2.4.89.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 3d7b671..b6546c9 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.88
+LIBDRM_VERSION = 2.4.89
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
