From: Robert Rose <robertroyrose@gmail.com>
Date: Wed, 28 Nov 2018 21:47:12 -0800
Subject: [Buildroot] [PATCH v3 1/2] c-ares: support host build
Message-ID: <20181129054713.9643-1-robertroyrose@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Robert Rose <robertroyrose@google.com>

Signed-off-by: Robert Rose <robertroyrose@google.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 67254244a1..76e9687b37 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = ares_mkquery.c
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
