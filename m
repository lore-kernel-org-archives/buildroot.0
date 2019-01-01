From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 Jan 2019 21:07:20 +0200
Subject: [Buildroot] [PATCH] package/libssh: bump to version 0.8.6
Message-ID: <705878ea38b9e8fed5f8985f25467ee0eee4b7d5.1546369640.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license file hash; last paragraph text formatting change.

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/libssh.hash | 6 +++---
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 9ddada4a162e..3971519a9c2c 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.8/libssh-0.8.5.tar.xz.asc
+# https://www.libssh.org/files/0.8/libssh-0.8.6.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 07d2c431240fc88f6b06bcb36ae267f9afeedce2e32f6c42f8844b205ab5a335  libssh-0.8.5.tar.xz
-sha256 468cf08f784ef6fd3b3705b60dd8111e2b70fbb8f6549cd503665a6bbb3bc625  COPYING
+sha256 1046b95632a07fc00b1ea70ee683072d0c8a23f544f4535440b727812002fd01  libssh-0.8.6.tar.xz
+sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 5d3b87aafc74..016d67546f02 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.8
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.19.2
