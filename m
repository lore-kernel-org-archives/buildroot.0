From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 16:21:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libp11: bump version to 0.4.10
Message-ID: <20191006142144.7525-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libp11/libp11.hash | 2 +-
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 01cea6466b..bba5c770a2 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 9d1c76d74c21ca224f96204982097ebc6b956f645b2b0b5f9c502a20e9ffcfd8  libp11-0.4.9.tar.gz
+sha256 639ea43c3341e267214b712e1e5e12397fd2d350899e673dd1220f3c6b8e3db4  libp11-0.4.10.tar.gz
 sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 08c32dcd15..cf3e78d2dd 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.9
+LIBP11_VERSION = 0.4.10
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.20.1
