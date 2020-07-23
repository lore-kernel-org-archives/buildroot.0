From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:26:09 +0200
Subject: [Buildroot] [git commit] package/gettext-tiny: bump to version 0.3.2
Message-ID: <20200723142215.1403488016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86863c381ef8893a2804a1d482b5d8e2add7a424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Adapt license hash
  (minor additions in LICENSE file about files in doc folder:
  "Files contained in the doc/ directory may be licensed under different terms.",
  but there are no folder present so no license change)
- Also separate the fields in the hash file by two spaces

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.hash | 8 ++++----
 package/gettext-tiny/gettext-tiny.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 201b05c6ff..5155b41910 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -1,6 +1,6 @@
 # Locally Computed:
-sha256 efc740007c82a9b3a0d382fb50d212fa7dc0beddb9695409ee79684f9f2124b2  gettext-tiny-adaa9c64921e80f2b8dd3610ffb508618b9204f3.tar.gz
-sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
-sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
+sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettext-tiny-0.3.2.tar.gz
+sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
-sha1 62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90 gettext-0.20.1.tar.xz
+sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 87813ae5af..c297cb1fe5 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GETTEXT_TINY_VERSION = adaa9c64921e80f2b8dd3610ffb508618b9204f3
-GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
+GETTEXT_TINY_VERSION = 0.3.2
+GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,v$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
 GETTEXT_TINY_LICENSE_FILES = LICENSE
