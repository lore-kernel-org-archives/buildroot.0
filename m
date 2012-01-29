From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:43 +0100
Subject: [Buildroot] [RFC 10/15] directfb: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-11-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/directfb/directfb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 977d272..fb6450c 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -7,6 +7,7 @@ DIRECTFB_VERSION_MAJOR = 1.4
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).15
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
+DIRECTFB_LICENSE = LGPL_V2.1
 DIRECTFB_AUTORECONF = YES
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_CONF_OPT = \
-- 
1.7.5.4
