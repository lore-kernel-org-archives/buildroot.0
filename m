From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:01:43 +0200
Subject: [Buildroot] [git commit] execline: bump version to 2.3.0.2
Message-ID: <20170909195854.42ED4800A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aee4dc8f01689b67b6015f8c484d6eebe223144f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 54d9e28..f68ce1b 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 2bf65aaaf808718952e05c2221b4e9472271e53ebd915c8d1d49a3e992583bf4  execline-2.3.0.1.tar.gz
+sha256 c11650651a7230bd5687945a7698b2da3fe13c3c0eb15e296bb91769d4775f45  execline-2.3.0.2.tar.gz
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 576f11c..7fed626 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.3.0.1
+EXECLINE_VERSION = 2.3.0.2
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
