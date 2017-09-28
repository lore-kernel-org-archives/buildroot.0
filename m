From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Sep 2017 23:00:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencore-amr: fix license,
	add license hash
Message-ID: <20170928210046.3653-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/656/65667eb8fa1d447251b707e8a201d811cdaf7590/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opencore-amr/opencore-amr.hash | 1 +
 package/opencore-amr/opencore-amr.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/opencore-amr/opencore-amr.hash b/package/opencore-amr/opencore-amr.hash
index 5d11286b6a..b333822b90 100644
--- a/package/opencore-amr/opencore-amr.hash
+++ b/package/opencore-amr/opencore-amr.hash
@@ -3,3 +3,4 @@ md5 e0798587b91411cc092aa73091a97dfc  opencore-amr-0.1.5.tar.gz
 sha1 bef4d1e3a8a155b47569b6691a223843b33e279e  opencore-amr-0.1.5.tar.gz
 # Locally computed:
 sha256 2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341  opencore-amr-0.1.5.tar.gz
+sha256 8b3f1762349248d444ab9acbafe73941254e36e1064954da56bb9ddbd5873ddb  LICENSE
diff --git a/package/opencore-amr/opencore-amr.mk b/package/opencore-amr/opencore-amr.mk
index 115f97cb37..ac366e2466 100644
--- a/package/opencore-amr/opencore-amr.mk
+++ b/package/opencore-amr/opencore-amr.mk
@@ -8,6 +8,6 @@ OPENCORE_AMR_VERSION = 0.1.5
 OPENCORE_AMR_SITE = http://downloads.sourceforge.net/project/opencore-amr/opencore-amr
 OPENCORE_AMR_INSTALL_STAGING = YES
 OPENCORE_AMR_LICENSE = Apache-2.0
-OPENCORE_AMR_LICENSE_FILES = COPYING
+OPENCORE_AMR_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
2.11.0
