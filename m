From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:52:03 +0100
Subject: [Buildroot] [git commit] libao: add license information
Message-ID: <20130121225448.4D2E99A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee4c73b75e0bc869e7fc3a89a4cb7bb00fdb1c45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv2+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libao/libao.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index aee85a9..d0234d5 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -8,6 +8,8 @@ LIBAO_VERSION = 1.1.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
+LIBAO_LICENSE = GPLv2+
+LIBAO_LICENSE_FILES = COPYING
 LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
 			--disable-nas --disable-pulse
 
