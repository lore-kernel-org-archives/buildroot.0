From: Michael Vetter <jubalh@iodoru.org>
Date: Tue,  8 Dec 2020 08:54:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: security bump to 2.0.23
Message-ID: <20201208075404.30032-1-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:
* Fix CVE-2020-27828, heap-overflow in cp_create() in jpc_enc.c

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 5edf45e6db..2a0a4fdff0 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  afc4166bff29b8a0dc46ed5e8d6a208d7976fccfd0b1146e3400c8b2948794a2  jasper-2.0.22.tar.gz
+sha256  20facc904bd9d38c20e0c090b1be3ae02ae5b2703b803013be2ecad586a18927  jasper-2.0.23.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index ab7cb933bc..3386108323 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.22
+JASPER_VERSION = 2.0.23
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.26.2
