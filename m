From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:33:55 +0100
Subject: [Buildroot] [git commit] libupnp: bump to version 1.6.24
Message-ID: <20171201205335.B036A7FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1c5703e84b83f00b01dea98467293b3033c1d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 1012461..3b45d53 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	0bdfacb7fa8d99b78343b550800ff193264f92c66ef67852f87f042fd1a1ebbc	libupnp-1.6.22.tar.bz2
+sha256	7d83d79af3bb4062e5c3a58bf2e90d2da5b8b99e2b2d57c23b5b6f766288cf96	libupnp-1.6.24.tar.bz2
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index bf01b4d..c7085c2 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.22
+LIBUPNP_VERSION = 1.6.24
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
