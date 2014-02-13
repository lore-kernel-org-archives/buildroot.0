From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 13 Feb 2014 22:17:54 +0100
Subject: [Buildroot] [PATCH 1/2] nut: disable hal
Message-ID: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/nut/nut.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 04b2b41..47367e1 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -85,4 +85,6 @@ else
 NUT_CONF_OPT += --without-ssl
 endif
 
+NUT_CONF_OPT += --without-hal 
+
 $(eval $(autotools-package))
-- 
1.8.5.3
