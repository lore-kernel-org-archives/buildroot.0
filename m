From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 09:01:43 -0300
Subject: [Buildroot] [PATCH 1/2] libssh: security bump to version 0.7.3
Message-ID: <1456315304-25601-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-0739 - Bits/bytes confusion resulting in truncated
Difffie-Hellman secret length.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libssh/libssh.hash | 6 +++---
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 49bf6c9..1eef804 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,4 +1,4 @@
 # from https://red.libssh.org/projects/libssh/files/
-md5	5d7d468937649a6dfc6186edfff083db	libssh-0.7.2.tar.xz
-# Locally calculated after checking signature on uncompressed libssh-0.7.2.tar
-sha256	a32c45b9674141cab4bde84ded7d53e931076c6b0f10b8fd627f3584faebae62  libssh-0.7.2.tar.xz
+md5	05465da8004f3258db946346213209de	libssh-0.7.3.tar.xz
+# Locally calculated after checking signature on uncompressed libssh-0.7.3.tar
+sha256	26ef46be555da21112c01e4b9f5e3abba9194485c8822ab55ba3d6496222af98  libssh-0.7.3.tar.xz
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index d425ff0..29bbf4e 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBSSH_VERSION = 0.7.2
+LIBSSH_VERSION = 0.7.3
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
-LIBSSH_SITE = https://red.libssh.org/attachments/download/177
+LIBSSH_SITE = https://red.libssh.org/attachments/download/195
 LIBSSH_LICENSE = LGPLv2.1
 LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
-- 
2.4.10
