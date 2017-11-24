From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Nov 2017 19:00:11 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp: bump to version 1.6.24
Message-ID: <20171124180011.21506-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 314c68e82..929e5c42e 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	0bdfacb7fa8d99b78343b550800ff193264f92c66ef67852f87f042fd1a1ebbc	libupnp-1.6.22.tar.bz2
+sha256	7d83d79af3bb4062e5c3a58bf2e90d2da5b8b99e2b2d57c23b5b6f766288cf96	libupnp-1.6.24.tar.bz2
 sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index bf01b4d94..c7085c214 100644
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
-- 
2.14.1
