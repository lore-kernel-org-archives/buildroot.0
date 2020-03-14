From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:58:09 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/exiv2: bump
 version to 0.27.2
Message-ID: <20200314174632.54F7F83A57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4a3e08fb8aa670ee1a93e24f38a47f6e206b888
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes
https://www.exiv2.org/whatsnew.html

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[Thomas: encode the 'v' in EXIV2_SITE and not EXIV2_VERSION, so that
EXIV2_VERSION continues to match what is reported by
release-monitoring.org]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3abc962ac93903c76361d86f533cc8b38cc44e7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index b753c03854..7937d3f572 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 1b3766b2c203ce213a4195de14d61694017ec1a69d15d4575bccecef130990fe exiv2-0.27.1.tar.gz
+sha256 3dbcaf01fbc5b98d42f091d1ff0d4b6cd9750dc724de3d9c0d113948570b2934 exiv2-0.27.2.tar.gz
 sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
 sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 93af9382db..228b3a980e 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.1
-EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
+EXIV2_VERSION = 0.27.2
+EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
 EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
