From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2020 11:21:09 +0100
Subject: [Buildroot] [git commit] package/libubootenv: bump to version
 879c073
Message-ID: <20200130101225.B527584F18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d22bd3749eed504e5e14ffcf6f1afbaac8331f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

879c073 Do not hardcode path for install
d9c639b libubootenv: add pkg-config support

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 161a8dd5f7..bde2ac30e8 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4d948a8b7e4fb92c36c36a1a247c1bab4343c55b5324699d18ea012737dbedeb libubootenv-cc628ee0cd750be26275b6eaeaba4d324df11dec.tar.gz
+sha256 332c45d46401f1859f0781fd0fd316bb1c251264674677c26a4d9b9e1c592719 libubootenv-879c0731fa0725785b9fa4499bbf6aacd04ee4c2.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index ae3db40178..99cbd0da23 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = cc628ee0cd750be26275b6eaeaba4d324df11dec
+LIBUBOOTENV_VERSION = 879c0731fa0725785b9fa4499bbf6aacd04ee4c2
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
