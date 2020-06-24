From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 24 Jun 2020 13:05:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version 86bd30a
Message-ID: <1592996759-31938-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes the following changes:

86bd30a Restore ability to feed script file via stdin, using `-s -`.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 753f8f5..6ef2aa7 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a905431113db379900e862e8175575ecda21b3c63a87389ffc4a65122dfec9e  libubootenv-c91dccab34294b5ea9c6502d01bfdaa49639fd90.tar.gz
+sha256  15fe743c661e19e0fba6a91cad6e8e295e6358cb917f3752a0bf6e742027252c  libubootenv-86bd30a14e153a18f670b25708795253d8736f0f.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 1b6f116..65260b7 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = c91dccab34294b5ea9c6502d01bfdaa49639fd90
+LIBUBOOTENV_VERSION = 86bd30a14e153a18f670b25708795253d8736f0f
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
-- 
2.7.4
