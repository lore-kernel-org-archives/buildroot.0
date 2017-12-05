From: Ismael Luceno <ismael@iodev.co.uk>
Date: Tue,  5 Dec 2017 02:42:37 -0300
Subject: [Buildroot] [PATCH 3/3] axel: bump to version 2.16.1
In-Reply-To: <20171205054237.2150-1-ismael@iodev.co.uk>
References: <20171205054237.2150-1-ismael@iodev.co.uk>
Message-ID: <20171205054237.2150-3-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes building against static libssl.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index 1fc1c55ae07d..c317fb886f64 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1 @@
-sha256 bd65f8d8add34ab61ce1fb9e1c7b1c3449b1cfd981ce48aeee218e755ba0d6fb  axel-2.16.tar.xz
+sha256 d34094eb63eaebc989f96eabdda091dcfb28e840bb8d274a5f216775941f59e4  axel-2.16.1.tar.xz
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 136c2e26eb08..f02837e357e8 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.16
+AXEL_VERSION = 2.16.1
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
-- 
2.15.0
