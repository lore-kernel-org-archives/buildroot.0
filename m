From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:15:44 +0200
Subject: [Buildroot] [git commit] ushare: define license
Message-ID: <20130710202007.A7EC59A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c9578712794db59dc1448dffa982119e5ccd25b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ushare/ushare.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 5cdc931..25f880c 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -8,6 +8,8 @@ USHARE_VERSION = 1.1a
 USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
 USHARE_DEPENDENCIES = host-pkgconf libupnp
+USHARE_LICENSE = GPLv2+
+USHARE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 USHARE_DEPENDENCIES += gettext
