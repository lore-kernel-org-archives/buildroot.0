From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:44:31 +0200
Subject: [Buildroot] [git commit branch/next] cjson: bump version to v1.5.2
Message-ID: <20170510214447.296107FFD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a72aea6161b8deb1779af090f36e536c4e6478a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
