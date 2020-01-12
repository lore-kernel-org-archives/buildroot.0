From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Sun, 12 Jan 2020 17:55:32 +0100
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.0.21
Message-ID: <20200112165532.qcw32hxmphbqbknd@einstein.dilieto.eu>
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
index 3fac0da5d1..b8d631d50b 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c9106e166156685fcf9f164f0b2935cf680251a653f460b04da26a290e946bf9        uacme-1.0.20.tar.gz
+sha256	c80bbee3c2ac3a64f70abe23be3b7768039785863170ac062625407a0b61e635        uacme-1.0.21.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 0a662a2646..5813399c56 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.0.20
+UACME_VERSION = 1.0.21
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.11.0
