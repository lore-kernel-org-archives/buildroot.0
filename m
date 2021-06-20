From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Sun, 20 Jun 2021 14:16:54 +0200
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.7.1
Message-ID: <20210620121655.27242-1-nicola.dilieto@gmail.com>
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
index d0277c7322..4ae85c1c5c 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3f3de5f456907558c4aa0db5654c618becb1b3e057ad217e180c8f72360e7841  uacme-1.4.1.tar.gz
+sha256  36027a587256cbaa86650cec2a5b3eb000480e1150bd83941565661b392625ac  uacme-1.7.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 975a965dd0..2be96d534e 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.4.1
+UACME_VERSION = 1.7.1
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.11.0
