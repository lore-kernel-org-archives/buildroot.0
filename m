From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:42:33 +0100
Subject: [Buildroot] [git commit] package/prosody: add PROSODY_CPE_ID_VENDOR
Message-ID: <20210303122740.EBE8B844EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20455e47671d201dc7d28957eff0fc1b563d28b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:prosody:prosody is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprosody%3Aprosody

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
