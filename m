From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:07:11 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gssdp: bump
 version to 1.0.4
Message-ID: <20200721200730.D19728792B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce6351f61af28fab5e67ebce9eb39f76a68de5c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Required by gupnp-1.0.5.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index b389d0205c..ad1483667e 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.3.sha256sum:
-sha256 211387a62bc1d99821dd0333d873a781320287f5436f91e58b2ca145b378be41  gssdp-1.0.3.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.4.sha256sum:
+sha256 ab29f6eaed476cd4bd1004034620cc25d45102c08656bdf2301a667c95bc0d46  gssdp-1.0.4.tar.xz
 
 # Hash for license file:
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 071ad00109..8b44320bac 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 1.0
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).4
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.0+
