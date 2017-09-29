From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Sep 2017 09:05:18 +0200
Subject: [Buildroot] [git commit] package/opencore-amr: fix license,
	add license hash
Message-ID: <20170929065838.2EA997FD6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f04df2d65dcdbff18cdc4a173aeef574de97f2ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/656/65667eb8fa1d447251b707e8a201d811cdaf7590/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencore-amr/opencore-amr.hash | 1 +
 package/opencore-amr/opencore-amr.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/opencore-amr/opencore-amr.hash b/package/opencore-amr/opencore-amr.hash
index 5d11286..b333822 100644
--- a/package/opencore-amr/opencore-amr.hash
+++ b/package/opencore-amr/opencore-amr.hash
@@ -3,3 +3,4 @@ md5 e0798587b91411cc092aa73091a97dfc  opencore-amr-0.1.5.tar.gz
 sha1 bef4d1e3a8a155b47569b6691a223843b33e279e  opencore-amr-0.1.5.tar.gz
 # Locally computed:
 sha256 2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341  opencore-amr-0.1.5.tar.gz
+sha256 8b3f1762349248d444ab9acbafe73941254e36e1064954da56bb9ddbd5873ddb  LICENSE
diff --git a/package/opencore-amr/opencore-amr.mk b/package/opencore-amr/opencore-amr.mk
index 115f97c..ac366e2 100644
--- a/package/opencore-amr/opencore-amr.mk
+++ b/package/opencore-amr/opencore-amr.mk
@@ -8,6 +8,6 @@ OPENCORE_AMR_VERSION = 0.1.5
 OPENCORE_AMR_SITE = http://downloads.sourceforge.net/project/opencore-amr/opencore-amr
 OPENCORE_AMR_INSTALL_STAGING = YES
 OPENCORE_AMR_LICENSE = Apache-2.0
-OPENCORE_AMR_LICENSE_FILES = COPYING
+OPENCORE_AMR_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
