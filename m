From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:36:57 +0100
Subject: [Buildroot] [git commit] package/xvisor: bump to version 0.2.11
Message-ID: <20191029213153.D3CE48D598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6abfa7018e692605fe5d82a81fc05f7f68b2009c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xvisor/xvisor.hash | 3 ++-
 package/xvisor/xvisor.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
index c170fdb9f8..dee1ef1d08 100644
--- a/package/xvisor/xvisor.hash
+++ b/package/xvisor/xvisor.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 29b3b830380dde4f596611abd34487fb753e120ce462dbb0056f3025b88ef14f  xvisor-0.2.9.tar.gz
+sha256 a0c9537bd7fb06084c3da663f71bf6f2b1709e34b3b2fca2473c8db1cdd3de1d  xvisor-0.2.11.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index f75175a45c..6094370cc7 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-XVISOR_VERSION = 0.2.9
+XVISOR_VERSION = 0.2.11
+XVISOR_SOURCE = xvisor-$(XVISOR_VERSION).tar.xz
 XVISOR_SITE = http://www.xhypervisor.org/tarball
 XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
