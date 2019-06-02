From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jun 2019 20:12:45 -0000
Subject: [Buildroot] [git commit] package/openjpeg: bump to version 2.3.1
Message-ID: <20190602201234.2AB798EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a0f168c19b44c729247db1e055c049beccd11a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 8a6fda48c4..31c5b50409 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3389a1aa908c2b577863da213db3a170df3edbb1432e99ae5fd3f2ac721d69d3  openjpeg-51f097e6d5754ddae93e716276fe8176b44ec548.tar.gz
+sha256 63f5a4713ecafc86de51bfad89cc07bb788e9bba24ebbf0c4ca637621aadb6a9  openjpeg-2.3.1.tar.gz
 sha256 a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 6036ab95a3..1b119fa5fe 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 51f097e6d5754ddae93e716276fe8176b44ec548
-OPENJPEG_SITE = $(call github,uclouvain,openjpeg,$(OPENJPEG_VERSION))
+OPENJPEG_VERSION = 2.3.1
+OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_INSTALL_STAGING = YES
