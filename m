From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  8 Jan 2020 22:48:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcli: bump to version 1.10.2
Message-ID: <20200108214826.3583443-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of license file (updated LGPL-2.1:
https://github.com/dparrish/libcli/commit/41594c4284f14b828589ca0239ca29c2bdac5b96)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcli/libcli.hash | 4 ++--
 package/libcli/libcli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
index 729c636960..ce4373e92b 100644
--- a/package/libcli/libcli.hash
+++ b/package/libcli/libcli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3c801cb0112b6b5e07bdc3b98c034b36df6f33a8ed95ce74520b704bdbc0f36d  libcli-c63c9d35144939c8b4fa3c5394aed2e29ff517b0.tar.gz
-sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
+sha256 190f0a315dbc291400e9d33f701f9a66894102a6c29e1aebb63f01239bb164d0  libcli-1.10.2.tar.gz
+sha256 376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index 0fef008a4f..bc46082546 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCLI_VERSION = c63c9d35144939c8b4fa3c5394aed2e29ff517b0
-LIBCLI_SITE = $(call github,dparrish,libcli,$(LIBCLI_VERSION))
+LIBCLI_VERSION = 1.10.2
+LIBCLI_SITE = $(call github,dparrish,libcli,V$(LIBCLI_VERSION))
 LIBCLI_LICENSE = LGPL-2.1
 LIBCLI_LICENSE_FILES = COPYING
 LIBCLI_INSTALL_STAGING = YES
-- 
2.24.1
