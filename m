From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 22:05:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/uacme: bump
 version to 1.2.3
Message-ID: <20200727200252.47BAE821DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf92dbcf81ba9f12b57774394089e8ea7cde5555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This version fixes https://github.com/ndilieto/uacme/issues/22

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5946c1fe99f90c8f78170e6eed78adb03860e1d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index abc30a7e54..44cff5cf61 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	26fa153118fc895f0961502d644e3606cccb7fb261594c2b7dd293decd0b0174        uacme-1.2.2.tar.gz
+sha256	7e737eadc4495512f4f41e39b6ed4e14476922e26953f1be3446d69c8e63d189        uacme-1.2.3.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 61d3f11ca1..6df13eced6 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.2.2
+UACME_VERSION = 1.2.3
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
