From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Oct 2020 05:55:38 -0300
Subject: [Buildroot] [PATCH] package/stella: bump version to 6.3
Message-ID: <20201025085538.1065-1-sergio.prado@toradex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Sergio Prado <sergio.prado@toradex.com>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 31a3bef1e5af..18e325b1e45a 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  47b991af880b1699614c081d602c197942cfbdcbf52e3d738617923d5df23dc7  stella-6.2.1-src.tar.xz
+sha256  59ee35a3e49f52e64fa15e0217ecda90ccb768dcb075d997e72d5e5a3198f82e  stella-6.3-src.tar.xz
 sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 1a071cb0a9d8..1e2cbaf9fae8 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.2.1
+STELLA_VERSION = 6.3
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.17.1
