From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 14:32:38 +0100
Subject: [Buildroot] [PATCH] gettext: bump version to 0.19.6
Message-ID: <1441978358-43847-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gettext/gettext.hash |    6 +++---
 package/gettext/gettext.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext/gettext.hash b/package/gettext/gettext.hash
index 8d161f6..33fe515 100644
--- a/package/gettext/gettext.hash
+++ b/package/gettext/gettext.hash
@@ -1,3 +1,3 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2015-07/msg00008.html
-md5	9b7c37e410df4bd1bf854e8c897cf937	gettext-0.19.5.1.tar.xz
-sha1	668562227972d2645ac6c5930448ba74df65a53f	gettext-0.19.5.1.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00003.html
+md5 69d79254ee3b41df23f41c2f4fd720d9  gettext-0.19.6.tar.xz
+sha1 6033a0f87246c510dda9bfd8b3b3c488c0853156  gettext-0.19.6.tar.xz
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 5ef1ac4..724b393 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_VERSION = 0.19.5.1
+GETTEXT_VERSION = 0.19.6
 GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.xz
 GETTEXT_INSTALL_STAGING = YES
-- 
1.7.1
