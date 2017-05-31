From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 May 2017 08:51:14 +0200
Subject: [Buildroot] [git commit] libupnp: bump to version 1.6.22
Message-ID: <20170601202859.DBA05818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efe0c65b4bf556711dca540a8d0a8f723eaead6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index df39f32..1012461 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	af3f3c0846a1d75baeadae4aa5a2bda427567e2a1fb4559bf73ccff0a4f9a39b	libupnp-1.6.21.tar.bz2
+sha256	0bdfacb7fa8d99b78343b550800ff193264f92c66ef67852f87f042fd1a1ebbc	libupnp-1.6.22.tar.bz2
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 0701fb2..bf01b4d 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.21
+LIBUPNP_VERSION = 1.6.22
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
