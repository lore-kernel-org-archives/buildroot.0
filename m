From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:39:46 +0100
Subject: [Buildroot] [git commit] package/jack2: add JACK2_CPE_ID_VENDOR
Message-ID: <20210121212024.5EBDF88F36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=586b11c49084294ca26b13401231c8f4b9fb8214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:jackaudio:jack2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajackaudio%3Ajack2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
