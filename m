From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 May 2017 12:09:09 +0100
Subject: [Buildroot] [PATCH next 2/3] cjson: bump version to v1.5.2
In-Reply-To: <20170510110910.27889-1-Vincent.Riera@imgtec.com>
References: <20170510110910.27889-1-Vincent.Riera@imgtec.com>
Message-ID: <20170510110910.27889-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 09cc335..14853da 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 81e6574f0b1c0d7cd34fa5e0f3fd34b162fc1c568fc1473880999c2030bfb6f0  cjson-v1.5.1.tar.gz
+sha256 6d1482c1b492893b25ab7e77ee6098fe3ef10585df660e5ffe67e632a8c5b9e4  cjson-v1.5.2.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 43cd8bd..c0f4b98 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.5.1
+CJSON_VERSION = v1.5.2
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.10.2
