From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Dec 2018 15:21:22 +0200
Subject: [Buildroot] [PATCH] libssh: bump to version 0.8.5
Message-ID: <d339186411d307e9fb74ed53c19998a8fefbe324.1544534482.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 257b93cb6109..9ddada4a162e 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.8/libssh-0.8.4.tar.xz.asc
+# https://www.libssh.org/files/0.8/libssh-0.8.5.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 6bb07713021a8586ba2120b2c36c468dc9ac8096d043f9b1726639aa4275b81b  libssh-0.8.4.tar.xz
+sha256 07d2c431240fc88f6b06bcb36ae267f9afeedce2e32f6c42f8844b205ab5a335  libssh-0.8.5.tar.xz
 sha256 468cf08f784ef6fd3b3705b60dd8111e2b70fbb8f6549cd503665a6bbb3bc625  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 1ef09b3a211d..5d3b87aafc74 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.8
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.19.2
