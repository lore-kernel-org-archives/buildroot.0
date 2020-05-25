From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 25 May 2020 18:22:38 +0200
Subject: [Buildroot] [PATCH/next] package/libubootenv: bump to version
 c91dcca
Message-ID: <1590423758-27558-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index d7d71fc..753f8f5 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1afd4e70242a8196bf25622a4558d0baf9db5652d37d217156c08f6e37fd8e80  libubootenv-f4b9cde3815abe84a98079cedd515283ea08c16b.tar.gz
+sha256  9a905431113db379900e862e8175575ecda21b3c63a87389ffc4a65122dfec9e  libubootenv-c91dccab34294b5ea9c6502d01bfdaa49639fd90.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 2a7c0e7..1b6f116 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = f4b9cde3815abe84a98079cedd515283ea08c16b
+LIBUBOOTENV_VERSION = c91dccab34294b5ea9c6502d01bfdaa49639fd90
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
-- 
2.7.4
