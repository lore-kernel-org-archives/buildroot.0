From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 18:52:22 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/gssdp: bump to
 version 1.2.3
Message-ID: <20200722164934.E166B87D1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d546b005d36e4a498142e1871da4a60f498fc69e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a2f73e9930d3e46f1530aa865675439adc0e162)
[Peter: needed by gupnp-1.2.3]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 8e00e7e56b..f31f21942a 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.2.sha256sum:
-sha256  cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4  gssdp-1.2.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.3.sha256sum:
+sha256  a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8  gssdp-1.2.3.tar.xz
 
 # Hash for license file:
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 14eec0b5fd..02b10d961a 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 1.2
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.0+
