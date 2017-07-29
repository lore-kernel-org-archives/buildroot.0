From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Jul 2017 23:19:38 +0300
Subject: [Buildroot] [PATCH 2/2] librsvg: security bump to version 2.40.18
In-Reply-To: <d8abd4dffe44b0b02408f19ce5eaf8e03e1610e3.1501359578.git.baruch@tkos.co.il>
References: <d8abd4dffe44b0b02408f19ce5eaf8e03e1610e3.1501359578.git.baruch@tkos.co.il>
Message-ID: <8161b23b85f5e21435533c64279f4d625f19c16d.1501359578.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.18.news

CVE-2017-11464 - Fix division-by-zero in the Gaussian blur code.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index f9844b23621b..9ab798120f92 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.16.sha256sum
-sha256	d48bcf6b03fa98f07df10332fb49d8c010786ddca6ab34cbba217684f533ff2e	librsvg-2.40.16.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.18.sha256sum
+sha256	bfc8c488c89c1e7212c478beb95c41b44701636125a3e6dab41187f1485b564c	librsvg-2.40.18.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 07c1e3a0d13f..c8afdfd69fff 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).16
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).18
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.13.2
