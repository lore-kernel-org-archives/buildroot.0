From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:22:56 +0200
Subject: [Buildroot] [git commit] package/libva: bump version to 2.7.1
Message-ID: <20200423200847.4AFC17FA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aef51388e0e06d092ce6439fd0bf9b4744a257b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/intel/libva/blob/5cef34fdf55b5f8a08fbfdfe5c5f8cc13b1d77ed/NEWS

Added upstream sha1 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.hash | 6 ++++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index ad9f9003a9..6251876036 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,5 @@
+# From https://github.com/intel/libva/releases/download/2.7.1/libva-2.7.1.tar.bz2.sha1sum
+sha1  75010bde98182c707e20910253b735cea43e068d  libva-2.7.1.tar.bz2
 # Locally computed
-sha256 b75be416615dea75c74314fae8919dd72ca46d06b4e009e029661c2c51d87d70  libva-2.7.0.tar.bz2
-sha256 c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
+sha256  a00ff19d9f969259b9784172adad7788dbf3de827d985c5d27c230efd5d98a04  libva-2.7.1.tar.bz2
+sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 84819ae2ef..b0c0b9b3cc 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.7.0
+LIBVA_VERSION = 2.7.1
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
