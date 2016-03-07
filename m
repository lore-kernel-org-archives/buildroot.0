From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  6 Mar 2016 22:47:03 -0300
Subject: [Buildroot] [PATCH] mpfr: bump to version 3.1.4
Message-ID: <1457315223-5465-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 8b6dc86..a8b642b 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16	mpfr-3.1.3.tar.xz
+sha256	761413b16d749c53e2bfd2b1dfaa3b027b0e793e404b90b5fbaeef60af6517f5	mpfr-3.1.4.tar.xz
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index ec16d1c..5c3a6ef 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 3.1.3
+MPFR_VERSION = 3.1.4
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPLv3+
-- 
2.4.10
