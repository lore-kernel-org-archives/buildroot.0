From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:58:17 +0200
Subject: [Buildroot] [git commit] diffutils: bump to version 3.5
Message-ID: <20160902142939.4E1017FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce55f82eda08597c52ea45ad2c79ffe55f4d5a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/diffutils/diffutils.hash | 2 +-
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index 2094e97..7e99f1f 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 db53c025f2ac3d217bcf753dad6dee7b410b33d0948495ff015aaf8b91189ce2  diffutils-3.4.tar.xz
+sha256	dad398ccd5b9faca6b0ab219a036453f62a602a56203ac659b43e889bec35533	diffutils-3.5.tar.xz
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 9370f66..d3e608c 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.4
+DIFFUTILS_VERSION = 3.5
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
