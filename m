From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 00:34:18 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/diffutils: bump version to 3.6
Message-ID: <20170525223418.3379-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/diffutils/diffutils.hash | 2 +-
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index 7e99f1fc6..5506ab275 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	dad398ccd5b9faca6b0ab219a036453f62a602a56203ac659b43e889bec35533	diffutils-3.5.tar.xz
+sha256 d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6  diffutils-3.6.tar.xz
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index dee3faca1..4662e2bc3 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.5
+DIFFUTILS_VERSION = 3.6
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
2.11.0
