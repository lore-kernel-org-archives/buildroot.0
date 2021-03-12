From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 12 Mar 2021 14:05:29 -0600
Subject: [Buildroot] [PATCH 3/8] package/diffutils: add host package
In-Reply-To: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20210312200534.923-4-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/diffutils/diffutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 586b81ace8..107de79383 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -18,3 +18,4 @@ DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.1
