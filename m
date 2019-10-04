From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 4 Oct 2019 12:09:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/uacme: bump version to 1.0.20
Message-ID: <20191004100951.fvw7f7tij4hcg5ag@einstein.dilieto.eu>
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
index b7c4d8d..3fac0da 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	d5557bbb8a44b8902bd0c45fbdeaa84610a7ef605ec5b0f1245d9eea24c4a640	uacme-1.0.19.tar.gz
+sha256	c9106e166156685fcf9f164f0b2935cf680251a653f460b04da26a290e946bf9        uacme-1.0.20.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index c920a90..be06030 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.0.19
+UACME_VERSION = 1.0.20
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.1.4
