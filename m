From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu,  2 Jul 2020 20:39:33 -0300
Subject: [Buildroot] [PATCH] package/exempi: bump version to 2.5.2
Message-ID: <20200702233933.22423-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also change the hash file to separate the fields by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/exempi/exempi.hash | 4 ++--
 package/exempi/exempi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index e8b71a483ea8..5ea968305386 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 100b3d5b1b3370bc2e31c0978991716c4a4478246a2ac2df6382054a0ae89bc8  exempi-2.5.1.tar.bz2
-sha256 3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
+sha256  52f54314aefd45945d47a6ecf4bd21f362e6467fa5d0538b0d45a06bc6eaaed5  exempi-2.5.2.tar.bz2
+sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 2b6bd4fa81fb..3790b16b3287 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXEMPI_VERSION = 2.5.1
+EXEMPI_VERSION = 2.5.2
 EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
-- 
2.17.1
