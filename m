From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:44 -0700
Subject: [Buildroot] [PATCH 05/11] libupnp: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-5-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libupnp/libupnp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index d4777b5..b98b9f4 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -9,5 +9,7 @@ LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
+LIBUPNP_LICENSE = BSD-3c
+LIBUPNP_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
1.7.4.1
