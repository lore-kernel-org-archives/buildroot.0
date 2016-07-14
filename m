From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Jul 2016 07:10:15 -0300
Subject: [Buildroot] [PATCH] nasm: bump to version 2.12.02
Message-ID: <1468491015-26459-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index 4ec1853..5d7c36d 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9dbba1ce620512e435ba57e69e811fe8e07d04359e47e0a0b5e94a5dd8367489	nasm-2.12.01.tar.xz
+sha256	4c866b60c0b1c4ebc715205d007b4640ff4e36af637c9a7deb87b2900e544321	nasm-2.12.02.tar.xz
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index e9343be..f5d9ea0 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.12.01
+NASM_VERSION = 2.12.02
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2c
-- 
2.7.3
