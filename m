From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Tue, 18 Feb 2020 21:12:17 +0100
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.0.22
Message-ID: <20200218201217.rl7y2mzkivri6mxz@einstein.dilieto.eu>
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
index b8d631d50b..5c68680b54 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c80bbee3c2ac3a64f70abe23be3b7768039785863170ac062625407a0b61e635        uacme-1.0.21.tar.gz
+sha256	08070779232c9711a227189ee2d3cb55042f6be2ea0aa59525cb7b554c4688b0        uacme-1.0.22.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 5813399c56..c5931e2682 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.0.21
+UACME_VERSION = 1.0.22
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.11.0
