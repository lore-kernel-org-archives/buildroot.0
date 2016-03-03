From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 15:08:04 +0100
Subject: [Buildroot] [git commit] clamav: bump to version 0.99.1
Message-ID: <20160303140922.CFD4B7FD93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c8e5dd69f4f281b2b497ae7ec9ec95c47e7c80c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 8 ++++----
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index f1931ad..f80474b 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.99/
-sha1	7834baf3ce4898dd856e652c9d0301a8e14b4615	clamav-0.99.tar.gz
-# Locally computed
-sha256	d2792c8cfadd685fffc40b2199679628815df031fd3149ccf961649fc8787ea9	clamav-0.99.tar.gz
+# From http://sourceforge.net/projects/clamav/files/clamav/0.99.1/
+sha1	9b9706b951fbb35cf6743ef497649fdf20f167f9	clamav-0.99.1.tar.gz
+# Calculated based on the hash above
+sha256	e144689122d3f91293808c82cbb06b7d3ac9eca7ae29564c5d148ffe7b25d58a	clamav-0.99.1.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 35afd1e..16178cd 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.99
+CLAMAV_VERSION = 0.99.1
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
