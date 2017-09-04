From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 22:51:31 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] librsvg: security bump to
	version 2.40.18
Message-ID: <20170904205601.AF8368211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f9fedb2174a3bb6d670a7eb459455d99d41c2d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.18.news

CVE-2017-11464 - Fix division-by-zero in the Gaussian blur code.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b76a15ed14631a97e8cec56363858356a6d595d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index f9844b2..9ab7981 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.16.sha256sum
-sha256	d48bcf6b03fa98f07df10332fb49d8c010786ddca6ab34cbba217684f533ff2e	librsvg-2.40.16.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.18.sha256sum
+sha256	bfc8c488c89c1e7212c478beb95c41b44701636125a3e6dab41187f1485b564c	librsvg-2.40.18.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index db57193..16375d5 100644
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
