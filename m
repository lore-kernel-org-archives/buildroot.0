From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Feb 2021 22:45:53 +0100
Subject: [Buildroot] [git commit] package/ngircd: bump to version 26.1
Message-ID: <20210209212736.C9811815F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e8c3b58336cd6242dbb76ec576704d6fe108d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ngircd/ngircd/releases/tag/rel-26.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngircd/ngircd.hash | 2 +-
 package/ngircd/ngircd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ngircd/ngircd.hash b/package/ngircd/ngircd.hash
index 72874c8d49..e46e8e6669 100644
--- a/package/ngircd/ngircd.hash
+++ b/package/ngircd/ngircd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  56dcc6483058699fcdd8e54f5010eecee09824b93bad7ed5f18818e550d855c6  ngircd-26.tar.xz
+sha256  55c16fd26009f6fc6a007df4efac87a02e122f680612cda1ce26e17a18d86254  ngircd-26.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 4859a29c2f..5e31ae7d3a 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 26
+NGIRCD_VERSION = 26.1
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
