From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:58:28 +0200
Subject: [Buildroot] [git commit] libnspr: bump version to 4.17
Message-ID: <20171015135107.41DFA810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1363093248b6198eab285124b2c87411155a0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnss 3.33 needs libnspr >= 4.17.

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.hash | 6 ++++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 13cee6e..46c091e 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.15/src/SHA256SUMS
-sha256	27dde06bc3d0c88903a20d6ad807361a912cfb624ca0ab4efb10fc50b19e2d80	nspr-4.15.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.17/src/SHA256SUMS
+sha256	590a0aea29412ae22d7728038c21ef2ab42646e48172a47d2e4bb782846d1095  nspr-4.17.tar.gz
+# Locally calculated
+sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 7659baf..0c782ae 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.15
+LIBNSPR_VERSION = 4.17
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
