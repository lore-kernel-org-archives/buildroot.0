From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Mar 2017 15:41:09 +0000
Subject: [Buildroot] [PATCH] poppler: bump version to 0.53.0
Message-ID: <20170321154109.1311-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 1c57ef3..83856a3 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	528b661738839f9a25f6e580fcd2d5db007e0a1948580c6489f0062798ca1992	poppler-0.52.0.tar.xz
+sha256 592bf72960c6b5948b67657594b05e72d9a278daf7613c9f3cdff9a5b73096a8  poppler-0.53.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5c2d096..d5f1378 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.52.0
+POPPLER_VERSION = 0.53.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.10.2
