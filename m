From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Jul 2017 10:46:07 +0200
Subject: [Buildroot] [git commit] libssh: bump to version 0.7.5
Message-ID: <20170709091155.2FBA281DCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c48da7ad4c26db0631c619d3ac57a388a1443c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.hash | 7 ++++---
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 1eef804..009a335 100644
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
index b6b6dbb..34716c5 100644
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
