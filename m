From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:32:14 +0200
Subject: [Buildroot] [git commit] glibmm: bump to 2.54.1
Message-ID: <20171018202455.9C21E80F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4753dda7964df176f61127f8b3385c5fec4d6687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index e1b379f..570192e 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.52/glibmm-2.52.0.sha256sum
-sha256	81b8abf21c645868c06779abc5f34efc1a51d5e61589dab2a2ed67faa8d4811e glibmm-2.52.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/glibmm/2.54/glibmm-2.54.1.sha256sum
+sha256	7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a glibmm-2.54.1.tar.xz
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 303eac6..7fa13f2 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.52
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
+GLIBMM_VERSION_MAJOR = 2.54
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).1
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
