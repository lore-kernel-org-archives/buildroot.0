From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jul 2018 18:41:21 +0200
Subject: [Buildroot] [git commit] sed: bump to version 4.5
Message-ID: <20180710164050.949528822A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eded10a33b5252b9769ebb8813bf9dadb2634ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add signature and key reference.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sed/sed.hash | 6 +++++-
 package/sed/sed.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index 652c573615..470e5f2595 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	cbd6ebc5aaf080ed60d0162d7f6aeae58211a1ee9ba9bb25623daa6cd942683b	sed-4.4.tar.xz
+# https://ftp.gnu.org/gnu/sed/sed-4.5.tar.xz.sig
+# with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
+sha256	7aad73c8839c2bdadca9476f884d2953cdace9567ecd0d90f9959f229d146b40	sed-4.5.tar.xz
+# Locally calculated
+sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 28df140d39..4b2ed0313f 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.4
+SED_VERSION = 4.5
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
