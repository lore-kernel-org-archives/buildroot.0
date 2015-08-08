From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:12 -0000
Subject: [Buildroot] [git commit branch/next] package/libuv: bump to version
	1.6.1
Message-ID: <20150808105610.028508030B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30f238c9ce6300d91992ca854b6874dba63d9e35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuv/libuv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 0ce8420..505c8d8 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.5.0
+LIBUV_VERSION = v1.6.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
