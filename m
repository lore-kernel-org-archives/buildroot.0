From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:34:05 +0200
Subject: [Buildroot] [git commit] package/uacme: bump version to 1.4.1
Message-ID: <20200606214426.EC1A082AB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da7ff8f6994e06de0c7d8b5c03440b5d0be3639a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 866cf86dbf..d0277c7322 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b219484f9f018dffb4a57c4c37e0e4b6aa15bb00705ad71b6f7b8dd94baf0380  uacme-1.3.tar.gz
+sha256  3f3de5f456907558c4aa0db5654c618becb1b3e057ad217e180c8f72360e7841  uacme-1.4.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 21a946990c..975a965dd0 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.3
+UACME_VERSION = 1.4.1
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
