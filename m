From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Mar 2016 10:15:59 -0300
Subject: [Buildroot] [PATCH] nasm: bump to version 2.12.01
Message-ID: <1458306959-31515-1-git-send-email-gustavo@zacarias.com.ar>
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
index ec64ae0..4ec1853 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	f34cc1e984ed619b8f9e96cea632e3c6fdea5e039069dbcb63397b7bd004f5a8	nasm-2.12.tar.xz
+sha256	9dbba1ce620512e435ba57e69e811fe8e07d04359e47e0a0b5e94a5dd8367489	nasm-2.12.01.tar.xz
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 3331d65..e9343be 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.12
+NASM_VERSION = 2.12.01
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2c
-- 
2.4.10
