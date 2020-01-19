From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2020 10:01:09 +0100
Subject: [Buildroot] [git commit] package/poco: bump to version 1.9.4
Message-ID: <20200119085327.16A3F829F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f722017ebc118d42806e1ed2267d83235b8dfd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 33e60dba45..0cdaf0d3f3 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43cc469c01d1f799efc51e2bfde6ffdf467b98a8a0901e6b33db86958619b3af  poco-1.8.1.tar.gz
+sha256  367014cdbcfe9df8f1d746239902149d2398af9b49ba2c1aaaa88616fd538f61  poco-1.9.4.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 7283447f9d..d2b668ae13 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.8.1
+POCO_VERSION = 1.9.4
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
