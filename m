From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  1 Aug 2020 16:20:33 +0200
Subject: [Buildroot] [PATCHv3 3/5] package/terminology: bump to version 1.8.0
In-Reply-To: <20200801142035.4060526-1-romain.naour@gmail.com>
References: <20200801142035.4060526-1-romain.naour@gmail.com>
Message-ID: <20200801142035.4060526-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://www.enlightenment.org/news/2020-07-26-terminology-1.8.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/terminology/terminology.hash | 6 +++---
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index ed386fb7b3..3ec74d93c1 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.6.0.tar.xz.sha256sum
-sha256  b95cb05653afe0dad77fc038a8d5276c02a9c08d64ac97ddf0cee8087d27bd77  terminology-1.6.0.tar.xz
-sha256  a907d434f4691990ed8f2826ff7546672e9934a26c798351da12ed544dadc628  COPYING
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.8.0.tar.xz.sha256sum
+sha256  c6f5b003412f25507277702cabe1a11d7190971343c1d6030aa7d3fe5b45765f  terminology-1.8.0.tar.xz
+sha256  6863ee700fc82b9c3b82a1627136f6935a9eb68e6a64491f20e00b4023c33622  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index add80825a7..8200613f8b 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.6.0
+TERMINOLOGY_VERSION = 1.8.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
-- 
2.25.4
