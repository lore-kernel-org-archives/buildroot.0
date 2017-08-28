From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 28 Aug 2017 15:53:24 +0200
Subject: [Buildroot] [PATCH] poppler: bump version to 0.57.0
Message-ID: <20170828135324.31744-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 699e7057b1..ffcc71e170 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 537f2bc60d796525705ad9ca8e46899dcc99c2e9480b80051808bae265cdc658  poppler-0.55.0.tar.xz
+sha256 0ea37de71b7db78212ebc79df59f99b66409a29c2eac4d882dae9f2397fe44d8  poppler-0.57.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 9ccf2ea060..6796437776 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.55.0
+POPPLER_VERSION = 0.57.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.11.0
