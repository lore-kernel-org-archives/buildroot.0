From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Thu, 23 Apr 2020 07:51:04 +0200
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.2.3
Message-ID: <20200423055104.lljafbjugkwzbzhm@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version fixes https://github.com/ndilieto/uacme/issues/22

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
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
-- 
2.11.0
