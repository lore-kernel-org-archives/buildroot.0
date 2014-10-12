From: Alan Ott <alan@signal11.us>
Date: Sun, 12 Oct 2014 15:56:53 -0400
Subject: [Buildroot] [PATCH 2/2] poppler: Install files into staging
In-Reply-To: <1413143813-26783-1-git-send-email-alan@signal11.us>
References: <20140406120221.5a5fd253@skate>
 <1413143813-26783-1-git-send-email-alan@signal11.us>
Message-ID: <1413143813-26783-3-git-send-email-alan@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install poppler's header files into staging.

Signed-off-by: Alan Ott <alan@signal11.us>
Suggested-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
---
 package/poppler/poppler.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a52b079..a972325 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -10,6 +10,7 @@ POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
+POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-- 
2.1.0
