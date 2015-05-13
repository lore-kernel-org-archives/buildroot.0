From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 10:08:01 +0200
Subject: [Buildroot] [git commit] libmodbus: update download location
Message-ID: <20150513080938.5388E81D8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e5019181b1aa4c72e041914ab9ade972068a380
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Saves one HTTP 301 redirection.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodbus/libmodbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index cf37359..1f8c730 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMODBUS_VERSION = 3.0.6
-LIBMODBUS_SITE = http://libmodbus.org/site_media/build
+LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPLv2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
