From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Dec 2016 20:30:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/taglib: bump version to 1.11.1
Message-ID: <20161210193029.25238-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/taglib/taglib.hash | 2 +-
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index a3cfc79..7a5c5cf 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ed4cabb3d970ff9a30b2620071c2b054c4347f44fc63546dbe06f97980ece288	taglib-1.11.tar.gz
+sha256 b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b  taglib-1.11.1.tar.gz
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 0a2ca4d..f47c4ba 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.11
+TAGLIB_VERSION = 1.11.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPLv2.1, MPL
-- 
2.10.2
