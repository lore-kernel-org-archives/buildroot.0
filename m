From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Sat, 30 May 2020 22:49:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/uacme: bump version to 1.4.1
Message-ID: <20200530204900.4zrz7fkedh3ni23w@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index b3ec7ed6f2..d0277c7322 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7757883ffc305018d3d181a26d0b82a8a0c1f1d5eea21a14979b2c69750b595e  uacme-1.2.4.tar.gz
+sha256  3f3de5f456907558c4aa0db5654c618becb1b3e057ad217e180c8f72360e7841  uacme-1.4.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index be2aa60811..975a965dd0 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.2.4
+UACME_VERSION = 1.4.1
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.11.0
