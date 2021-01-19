From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 22:53:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/jack2: add JACK2_CPE_ID_VENDOR
In-Reply-To: <20210119215314.1040456-1-fontaine.fabrice@gmail.com>
References: <20210119215314.1040456-1-fontaine.fabrice@gmail.com>
Message-ID: <20210119215314.1040456-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:jackaudio:jack2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajackaudio%3Ajack2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index d09b54b35c..e6a036bac9 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -8,6 +8,7 @@ JACK2_VERSION = 1.9.17
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
+JACK2_CPE_ID_VENDOR = jackaudio
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
 JACK2_INSTALL_STAGING = YES
 
-- 
2.29.2
