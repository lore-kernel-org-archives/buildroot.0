From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 18 Feb 2020 21:47:19 +0100
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version ba952d0
Message-ID: <1582058839-1595-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes the following changes:

ba952d0 BUG: variable lists not released in close()
690f868 Variables are not removed when loading from file
9e3586a Make sure there's no file descriptor leakage in case of error
03647c4 Check config file defines a non-zero Sector size
3b2d4f1 Check environment size from fw_env.config

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index bde2ac3..383f550 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 332c45d46401f1859f0781fd0fd316bb1c251264674677c26a4d9b9e1c592719 libubootenv-879c0731fa0725785b9fa4499bbf6aacd04ee4c2.tar.gz
+sha256 dc84eefd7dcde46e6754517be37dc0c5a6cd07d38db06564eb54acd9b9ff936e libubootenv-ba952d05ec9ab16029816a06d956bac7fb4e9832.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 99cbd0d..44f8478 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 879c0731fa0725785b9fa4499bbf6aacd04ee4c2
+LIBUBOOTENV_VERSION = ba952d05ec9ab16029816a06d956bac7fb4e9832
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
-- 
2.7.4
