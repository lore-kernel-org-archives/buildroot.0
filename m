From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:23:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/pango: bump to
 version 1.48.4
Message-ID: <20210621190356.263948876F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5793fdfdc3efd1506484b23a4ff8bfefe9dd2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4428c5bc2f25df600a028945d30ac60b93886c65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index a672b7cfaf..3d6167058e 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.0.sha256sum
-sha256  391f26f3341c2d7053e0fb26a956bd42360dadd825efe7088b1e9340a65e74e6  pango-1.48.0.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.4.sha256sum
+sha256  418913fb062071a075846244989d4a67aa5c80bf0eae8ee4555a092fd566a37a  pango-1.48.4.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 803e46f193..cc09e3a64d 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.48
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
