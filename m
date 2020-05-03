From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 21:22:55 +0200
Subject: [Buildroot] [git commit] package/wlroots: add license file
 information
Message-ID: <20200503190925.CF04C90E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c97f28a04d1b61c2c9392eaf7227a9b44a4688e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wlroots/wlroots.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 136dc2bfcd..988643485f 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -7,6 +7,7 @@
 WLROOTS_VERSION = 0.10.1
 WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
 WLROOTS_LICENSE = MIT
+WLROOTS_LICENSE_FILES = LICENSE
 WLROOTS_INSTALL_STAGING = YES
 
 WLROOTS_DEPENDENCIES = \
