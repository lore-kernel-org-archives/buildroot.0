From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  9 Jul 2017 00:49:00 +0300
Subject: [Buildroot] [PATCH] libssh: bump to version 0.7.5
Message-ID: <989c0615af8d49c23cf423e0e97ae47262669a5a.1499550540.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/libssh.hash | 7 ++++---
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 1eef804e5c3a..009a335e3b59 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,4 +1,5 @@
 # from https://red.libssh.org/projects/libssh/files/
-md5	05465da8004f3258db946346213209de	libssh-0.7.3.tar.xz
-# Locally calculated after checking signature on uncompressed libssh-0.7.3.tar
-sha256	26ef46be555da21112c01e4b9f5e3abba9194485c8822ab55ba3d6496222af98  libssh-0.7.3.tar.xz
+md5	d3fc864208bf607ad87cdee836894feb	libssh-0.7.5.tar.xz
+# Locally calculated after checking signature on uncompressed libssh-0.7.5.tar
+# https://red.libssh.org/attachments/download/217/libssh-0.7.5.tar.asc
+sha256	54e86dd5dc20e5367e58f3caab337ce37675f863f80df85b6b1614966a337095  libssh-0.7.5.tar.xz
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index b6b6dbb4578a..34716c502a14 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBSSH_VERSION = 0.7.3
+LIBSSH_VERSION = 0.7.5
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
-LIBSSH_SITE = https://red.libssh.org/attachments/download/195
+LIBSSH_SITE = https://red.libssh.org/attachments/download/218
 LIBSSH_LICENSE = LGPL-2.1
 LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
-- 
2.13.2
