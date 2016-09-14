From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Sep 2016 21:46:04 +0200
Subject: [Buildroot] [git commit] pango: bump to version 1.40.3
Message-ID: <20160914195048.D17747FE04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8e8c0b0c3b1228b1f0df356d6b3a9b0452ae51e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 036838c..1ea9f6b 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.2.sha256sum
-sha256	90582a02bc89318d205814fc097f2e9dd164d26da5f27c53ea42d583b34c3cd1	pango-1.40.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.3.sha256sum
+sha256	abba8b5ce728520c3a0f1535eab19eac3c14aeef7faa5aded90017ceac2711d3	pango-1.40.3.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index ba07aec..b45bf9a 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.40
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
