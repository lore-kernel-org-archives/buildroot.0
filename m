From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:46:10 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libupnp: bump to version
 1.6.25
Message-ID: <20180324204739.7D80180251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70c77467b9fe3033ee3670763594a4d50237d6d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes segmentation fault in upmpdcli. Closes #10766

[Peter: add bugzilla reference]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 18f33eee21d3ca947cf8a6b5c150bb29e8f711dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 929e5c42e7..e52b7ea9d7 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	7d83d79af3bb4062e5c3a58bf2e90d2da5b8b99e2b2d57c23b5b6f766288cf96	libupnp-1.6.24.tar.bz2
+sha256	c5a300b86775435c076d58a79cc0d5a977d76027d2a7d721590729b7f369fa43	libupnp-1.6.25.tar.bz2
 sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index c7085c2148..8831885ba4 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.24
+LIBUPNP_VERSION = 1.6.25
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
