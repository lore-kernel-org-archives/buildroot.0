From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:31 +0000
Subject: [Buildroot] [RFC PATCH v3 17/30] package/alsa-lib/alsa-lib: Add
 host package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-18-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/alsa-lib/alsa-lib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index fecf7d7cfa..7502a91259 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -67,3 +67,4 @@ ALSA_LIB_CONF_ENV = \
 	LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
