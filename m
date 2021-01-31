From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:25:28 +0100
Subject: [Buildroot] [git commit] package/faad2: add CPE variables
Message-ID: <20210131200523.577A682B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02815955d3243e51b73ce52562c931f8760e83b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:audiocoding:freeware_advanced_audio_decoder_2 is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaudiocoding%3Afreeware_advanced_audio_decoder_2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/faad2/faad2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 575abad17e..d085c814bd 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -8,6 +8,8 @@ FAAD2_VERSION = 2.10.0
 FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
+FAAD2_CPE_ID_VENDOR = audiocoding
+FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
