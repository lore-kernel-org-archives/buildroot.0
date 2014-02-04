From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 11:11:17 +0100
Subject: [Buildroot] [git commit] libupnp : bump version to 1.6.19
Message-ID: <20140204101607.928629C6D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=474f1bb9c7ecf6e5c6e8536e18beb986e3cba056
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnp/libupnp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index b98b9f4..48233b6 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.18
+LIBUPNP_VERSION = 1.6.19
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
