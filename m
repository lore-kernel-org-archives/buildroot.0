From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:29:51 +0200
Subject: [Buildroot] [git commit] chrony: bump to version 2.4
Message-ID: <20160607192957.3481481F6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2bb4233fa75c4c2e8f910835798a5f2a4a8b81c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.hash | 6 +++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index f39d316..da35f6b 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/02/msg00001.html
-md5  db6d46afea66f75dcc362f44623c1af4         chrony-2.3.tar.gz
-sha1 c5e2aac4e4ad904bf73663ed63964bec91482a8a chrony-2.3.tar.gz
+# From http://thread.gmane.org/gmane.comp.time.chrony.announce/36
+md5  d0598aa8a9be8faccef9386f6fc0d5f2  chrony-2.4.tar.gz
+sha1 8c243c545f242f869c9965e675828878970da5db  chrony-2.4.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 6416b83..adfbd36 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 2.3
+CHRONY_VERSION = 2.4
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
