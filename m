From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:12:15 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/libssh: bump
 version to 0.8.1
Message-ID: <20181024112042.66A3288866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55fe7b202b77a9ad086c167a8dd3273fd5b8ed3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixed broken _SITE, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 23430a63a789dccd635d58d699bfa6416340da8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.hash | 8 +++-----
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 009a335e3b..7220c337cf 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,3 @@
-# from https://red.libssh.org/projects/libssh/files/
-md5	d3fc864208bf607ad87cdee836894feb	libssh-0.7.5.tar.xz
-# Locally calculated after checking signature on uncompressed libssh-0.7.5.tar
-# https://red.libssh.org/attachments/download/217/libssh-0.7.5.tar.asc
-sha256	54e86dd5dc20e5367e58f3caab337ce37675f863f80df85b6b1614966a337095  libssh-0.7.5.tar.xz
+# Locally calculated after checking pgp signature
+sha256 d17f1267b4a5e46c0fbe66d39a3e702b8cefe788928f2eb6e339a18bb00b1924  libssh-0.8.1.tar.xz
+sha256 468cf08f784ef6fd3b3705b60dd8111e2b70fbb8f6549cd503665a6bbb3bc625  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 902865d73b..4295aa42ee 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.7
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
+LIBSSH_VERSION_MAJOR = 0.8
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).1
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
