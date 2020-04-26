From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 11:45:10 +0200
Subject: [Buildroot] [git commit] package/uacme: bump version to 1.2.4
Message-ID: <20200426093050.35DE7907C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=812cc01f6962926769422b5dbc9d652aca5982ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uacme/uacme.hash | 4 ++--
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 44cff5cf61..b3ec7ed6f2 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	7e737eadc4495512f4f41e39b6ed4e14476922e26953f1be3446d69c8e63d189        uacme-1.2.3.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  7757883ffc305018d3d181a26d0b82a8a0c1f1d5eea21a14979b2c69750b595e  uacme-1.2.4.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 6df13eced6..7e544fce79 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.2.3
+UACME_VERSION = 1.2.4
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
