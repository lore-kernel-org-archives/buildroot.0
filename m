From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:54:29 +0100
Subject: [Buildroot] [git commit] lame: add license information
Message-ID: <20130121225448.C698C9A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d280e814b667d12d836986e50ae72b7d0c0f8ec6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is LGPLv2+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/lame/lame.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index a251f02..0970592 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -12,6 +12,8 @@ LAME_DEPENDENCIES = host-pkgconf
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPT = --enable-dynamic-frontends
+LAME_LICENSE = LGPLv2+
+LAME_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
