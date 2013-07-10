From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:49 -0700
Subject: [Buildroot] [PATCH 10/11] ushare: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-10-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
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
-- 
1.7.4.1
