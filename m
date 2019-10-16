From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 16 Oct 2019 23:56:30 +0200
Subject: [Buildroot] [PATCH] package/caps: fix license string
Message-ID: <20191016215630.25426-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The correct license string is `GPL-3.0+` not `GPLv3`.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/caps/caps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/caps/caps.mk b/package/caps/caps.mk
index c4e94543a6..e307a689e0 100644
--- a/package/caps/caps.mk
+++ b/package/caps/caps.mk
@@ -7,7 +7,7 @@
 CAPS_VERSION = 0.9.26
 CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
 CAPS_SITE = http://quitte.de/dsp
-CAPS_LICENSE = GPLv3
+CAPS_LICENSE = GPL-3.0+
 CAPS_LICENSE_FILES = COPYING
 
 # Need to pass TARGET_CONFIGURE_OPTS in the environment to not
-- 
2.23.0
