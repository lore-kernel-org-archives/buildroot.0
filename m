From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:42:37 +0200
Subject: [Buildroot] [git commit] quazip: bump to version 0.7.2
Message-ID: <20160415074241.17AF381E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f497900bfd7236c0bb066f3a26cecb667b4ba22b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 84b56c7..2f73c45 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 78c984103555c51e6f7ef52e3a2128e2beb9896871b2cc4d4dbd4d64bff132de quazip-0.7.1.tar.gz
+sha256 91d827fbcafd099ae814cc18a8dd3bb709da6b8a27c918ee1c6c03b3f29440f4 quazip-0.7.2.tar.gz
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index adccf90..91b2f56 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.7.1
+QUAZIP_VERSION = 0.7.2
 QUAZIP_SITE = http://sourceforge.net/projects/quazip/files/quazip/$(QUAZIP_VERSION)
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
