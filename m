From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:28:08 +0200
Subject: [Buildroot] [git commit] package/libmodbus: bump to version 3.1.5
Message-ID: <20190730155429.8517482818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8ee7c23b54a823176e490ceba77209d9dc7c901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://libmodbus.org/2019/stable-and-development-releases/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 2d65e28a34..7f9a6e223b 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637  libmodbus-3.1.4.tar.gz
+sha256  f7a9538f23a8786b1ee62a4b75879b5c0e194e728350de1b741ce7d595970f06  libmodbus-3.1.5.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index e5a6c6385a..8df3ca25bb 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.4
+LIBMODBUS_VERSION = 3.1.5
 LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
