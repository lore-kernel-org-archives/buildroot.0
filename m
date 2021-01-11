From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 23:36:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: add
 FLATBUFFERS_CPE_ID_VENDOR
Message-ID: <20210111223644.1418984-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:google:flatbuffers is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agoogle%3Aflatbuffers

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flatbuffers/flatbuffers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 6a71ea9c79..814751f30b 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -8,6 +8,7 @@ FLATBUFFERS_VERSION = 1.12.0
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
+FLATBUFFERS_CPE_ID_VENDOR = google
 FLATBUFFERS_INSTALL_STAGING = YES
 
 FLATBUFFERS_CONF_OPTS += \
-- 
2.29.2
