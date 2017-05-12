From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 15:28:47 +0100
Subject: [Buildroot] [PATCH next 2/3] bc: add host package
In-Reply-To: <20170512142848.13956-1-Vincent.Riera@imgtec.com>
References: <20170512142848.13956-1-Vincent.Riera@imgtec.com>
Message-ID: <20170512142848.13956-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will be necessary for updating bc's version in a subsequent patch.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bc/bc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index a6446ce..4596192 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -17,3 +17,4 @@ BC_DEPENDENCIES += busybox
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.10.2
