From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 13 Apr 2016 14:27:56 +0200
Subject: [Buildroot] [PATCH 1/1] netsniff-ng: bump to version 0.6.1
Message-ID: <1460550476-10770-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/netsniff-ng/netsniff-ng.hash | 2 +-
 package/netsniff-ng/netsniff-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index b4b0500..5212497 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a76911f5a8ef0b92c42da568ceebc9e6559c02760f498785e22c8426b623d43f netsniff-ng-v0.6.0.tar.gz
+sha256 902661bcdbc129c6a6c1f69a72f921fffc9e765d005568dc153f09ca0097c180 netsniff-ng-v0.6.1.tar.gz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index eecceea..ad97a88 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = v0.6.0
+NETSNIFF_NG_VERSION = v0.6.1
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
 NETSNIFF_NG_LICENSE = GPLv2
 NETSNIFF_NG_LICENSE_FILES = README COPYING
-- 
1.8.3.1
