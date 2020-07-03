From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2020 21:51:35 +0200
Subject: [Buildroot] [git commit] package/exempi: bump version to 2.5.2
Message-ID: <20200703195248.356128232C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a11a603c79089aeea92cbaa96a5836f450ee5cf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also change the hash file to separate the fields by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/exempi/exempi.hash | 4 ++--
 package/exempi/exempi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index e8b71a483e..5ea9683053 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 100b3d5b1b3370bc2e31c0978991716c4a4478246a2ac2df6382054a0ae89bc8  exempi-2.5.1.tar.bz2
-sha256 3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
+sha256  52f54314aefd45945d47a6ecf4bd21f362e6467fa5d0538b0d45a06bc6eaaed5  exempi-2.5.2.tar.bz2
+sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 2b6bd4fa81..3790b16b32 100644
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
