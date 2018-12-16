From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:05 +0100
Subject: [Buildroot] [git commit] coxpcall: bump to version 1.17.0
Message-ID: <20181216110337.A30248D46F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40f0f3d0d25ad589f4eb2ba3881c3f8243620746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coxpcall/coxpcall.hash | 2 +-
 package/coxpcall/coxpcall.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coxpcall/coxpcall.hash b/package/coxpcall/coxpcall.hash
index e037af9e80..5676d47380 100644
--- a/package/coxpcall/coxpcall.hash
+++ b/package/coxpcall/coxpcall.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c1488ee08e5d25d59a11e19cb0322edae509202b246d0c93cb2de1676dbfdf2b  coxpcall-1.16.0-1.src.rock
+sha256 11feb07f08927c39b0b93e8c0bbaf15433f86155cba4820a31a09f4754ab3258  coxpcall-1.17.0-1.src.rock
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 3af81f2ceb..6633b925c4 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COXPCALL_VERSION = 1.16.0-1
+COXPCALL_VERSION = 1.17.0-1
 COXPCALL_SUBDIR = coxpcall
 COXPCALL_LICENSE = MIT
 COXPCALL_LICENSE_FILES = $(COXPCALL_SUBDIR)/doc/license.html
