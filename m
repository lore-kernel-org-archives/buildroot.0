From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 15:21:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libminiupnpc: bump to version
 2.1.20201016
Message-ID: <20201017132123.3182408-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation in hash file (two spaces)
- Update LICENSE hash (update in year:
  https://github.com/miniupnp/miniupnp/commit/922372bff32612adfc11cd0f20638820a9b124f1)

http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.1.20201016.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libminiupnpc/libminiupnpc.hash | 4 ++--
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 556d8cc45a..758ea29f59 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e19fb5e01ea5a707e2a8cb96f537fbd9f3a913d53d804a3265e3aeab3d2064c6  miniupnpc-2.1.tar.gz
-sha256 e2df21b3d4b1a84a0ac31d808a3ff330fdf3602e0839a526d3df2fcfba287ac4  LICENSE
+sha256  69f72fe355f911b807915f78dcfc0af772c0f22bc7ab1157e70f334e37db7d39  miniupnpc-2.1.20201016.tar.gz
+sha256  0b476c395af6dd21eeb54c40a21d22e1c11a751fbd2dd17a41ce26e370be88d5  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 5a4c8fc693..50b3c6604c 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.1
+LIBMINIUPNPC_VERSION = 2.1.20201016
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.28.0
