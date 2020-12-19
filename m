From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 19 Dec 2020 08:18:22 -0300
Subject: [Buildroot] [PATCH] package/stella: bump version to 6.4
Message-ID: <20201219111822.8247-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 18e325b1e45a..c40d96616ab3 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  59ee35a3e49f52e64fa15e0217ecda90ccb768dcb075d997e72d5e5a3198f82e  stella-6.3-src.tar.xz
+sha256  0346900e9ba4b6d532b72d956adc5078502a9bd6bbc1648bb3dd68f5ffd4859b  stella-6.4-src.tar.xz
 sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 1e2cbaf9fae8..2dcfbeaccd3c 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.3
+STELLA_VERSION = 6.4
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.17.1
