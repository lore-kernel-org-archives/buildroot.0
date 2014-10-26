From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:05:40 +0100
Subject: [Buildroot] [git commit] package/polarssl: cleanup configure options
Message-ID: <20141026160700.57579B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cf0738a2e4959a92a5ed5dbad1bf2be101adced
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test build is already disabled by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/polarssl/polarssl.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 98dd5bc..21bf160 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -8,7 +8,6 @@ POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.11
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPTS = \
-	-DBUILD_TESTS=OFF \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
 
 POLARSSL_INSTALL_STAGING = YES
