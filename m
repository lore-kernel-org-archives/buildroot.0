From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:29:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/prosody: add PROSODY_CPE_ID_VENDOR
Message-ID: <20210303092957.469188-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:prosody:prosody is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprosody%3Aprosody

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/prosody/prosody.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index b2641545b9..a4482ad3c5 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -8,6 +8,7 @@ PROSODY_VERSION = 0.11.8
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
+PROSODY_CPE_ID_VENDOR = prosody
 PROSODY_DEPENDENCIES = host-luainterpreter luainterpreter libidn openssl
 
 PROSODY_CFLAGS = $(TARGET_CFLAGS) -fPIC -std=c99 \
-- 
2.30.0
