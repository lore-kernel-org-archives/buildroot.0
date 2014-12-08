From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 17:06:42 +0000
Subject: [Buildroot] [PATCH] freetype: CVE-2014-2240: bump version to 2.5.4
Message-ID: <1418058402-44818-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://savannah.nongnu.org/bugs/?43661

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/freetype/freetype.hash |    2 ++
 package/freetype/freetype.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/freetype/freetype.hash

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
new file mode 100644
index 0000000..8184eb0
--- /dev/null
+++ b/package/freetype/freetype.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3b4e2c666b33b32ad29ff0fe5c6538e757d3c73368e5dfa88bd59b4bc95cbabb  freetype-2.5.4.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index b85d0ec..c2f7f13 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.5.3
+FREETYPE_VERSION = 2.5.4
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
-- 
1.7.1
