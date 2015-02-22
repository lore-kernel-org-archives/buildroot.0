From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 18:45:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/freerdp: fix a comment
Message-ID: <1424627150-2594-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 37568c0..50b8f18 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -176,6 +176,6 @@ else # ! SERVER && ! CLIENT
 
 FREERDP_CONF_OPTS += -DWITH_X11=OFF
 
-endif # ! USES_XLIBS
+endif # ! SERVER && ! CLIENT
 
 $(eval $(cmake-package))
-- 
1.9.1
