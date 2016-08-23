From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Aug 2016 10:27:47 -0300
Subject: [Buildroot] [PATCH] diffutils: bump to version 3.5
Message-ID: <1471958867-6960-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/diffutils/diffutils.hash | 2 +-
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index 27eace2..7e99f1f 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c	diffutils-3.3.tar.xz
+sha256	dad398ccd5b9faca6b0ab219a036453f62a602a56203ac659b43e889bec35533	diffutils-3.5.tar.xz
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 191fd2e..d3e608c 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.3
+DIFFUTILS_VERSION = 3.5
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
2.7.3
