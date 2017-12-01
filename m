From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:39:41 +0100
Subject: [Buildroot] [git commit] boinc: bump to version 7.8.4
Message-ID: <20171201213219.B6226812FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3801c4112abc116002813a882fd889352b80d676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for COPYING and COPYING.LESSER

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boinc/boinc.hash | 4 +++-
 package/boinc/boinc.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 292c327..3f31ee7 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,2 +1,4 @@
 # Locally computed:
-sha256 e3d5b190ec6cdc3512005469fab90203af110cd9a7880654c5d0b4d4e55f3c17  boinc-7.8.3.tar.gz
+sha256 0038044916749687455d0f5ca33e79f14e2d1d5451ddfd04b33446b2d9d467ab  boinc-7.8.4.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 901f1ee..a04aadf 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.8
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).3
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).4
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
