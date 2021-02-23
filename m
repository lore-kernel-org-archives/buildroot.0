From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 14:02:53 +0100
Subject: [Buildroot] [git commit] package/libuev: bump version to 2.3.2
Message-ID: <20210308072135.805898893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a3a47cc7462d33698a4b5ccf9d413129078e716
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update license hash (copyright year, maintainer surname, see [1])

[1] https://github.com/troglobit/libuev/commit/86e01be26ebe51824e6574ef186a532823bc085c#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuev/libuev.hash | 6 +++---
 package/libuev/libuev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
index fece0e9b65..d52d210d10 100644
--- a/package/libuev/libuev.hash
+++ b/package/libuev/libuev.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/libuev/releases/download/v2.3.1/libuev-2.3.1.tar.xz.md5
-md5  ec601f69f69477858fa023a75da23793  libuev-2.3.1.tar.xz
+# From https://github.com/troglobit/libuev/releases/download/v2.3.2/libuev-2.3.2.tar.xz.sha256
+sha256  af31ffe1058a2ff6c56fee26ec8749688704d297189b6a898380a601efefbec9  libuev-2.3.2.tar.xz
 # License files
-sha256  3c2bf3fdd85687242ba6f2b02b6ce5176aba15b5e1a2ccb8b608439197ec4641  LICENSE
+sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
index c7b73b4221..8a6759a2d7 100644
--- a/package/libuev/libuev.mk
+++ b/package/libuev/libuev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUEV_VERSION = 2.3.1
+LIBUEV_VERSION = 2.3.2
 LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
 LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
 LIBUEV_LICENSE = MIT
