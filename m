From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Sep 2019 22:51:57 +0200
Subject: [Buildroot] [git commit] package/axel: bump to version 2.17.6
Message-ID: <20190903204802.752C58A69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24d9eb5453771eb007793a6aedd45730e5641bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 2de602ae47..e7c128ed76 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1 @@
-sha256 5c5c682617d498071ff9083029fcecc2c2fdeeedc366c35d2bdf8663355616cc  axel-2.17.5.tar.xz
+sha256 24ab549021bdfca01ad5e8e95b706869dd30fe9ab1043da4cbb9dff89edc267d  axel-2.17.6.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 2ad8ff0881..d37eb4b5b2 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.5
+AXEL_VERSION = 2.17.6
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
