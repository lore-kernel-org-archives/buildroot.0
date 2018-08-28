From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 28 Aug 2018 11:36:30 +0200
Subject: [Buildroot] [PATCH 1/2] libyaml: bump to version 0.2.1
Message-ID: <20180828093631.7290-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libyaml/libyaml.hash | 2 +-
 package/libyaml/libyaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
index d4a0c335c3..755ea7bbd8 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729  yaml-0.1.7.tar.gz
+sha256 78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd  yaml-0.2.1.tar.gz
 sha256 d0d8b09800a45cd982e9568fc7669d9c1a4c330e275a821bbe24d54366d16fe9  LICENSE
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index bc8d6951bd..26e318736c 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYAML_VERSION = 0.1.7
+LIBYAML_VERSION = 0.2.1
 LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml
 LIBYAML_INSTALL_STAGING = YES
-- 
2.17.0
