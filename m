From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 12 Mar 2021 14:05:30 -0600
Subject: [Buildroot] [PATCH 4/8] package/findutils: add host package
In-Reply-To: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20210312200534.923-5-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/findutils/findutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 13d8271e18..278eeec9b9 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -15,3 +15,4 @@ FINDUTILS_CONF_ENV = \
 	gl_cv_func_wcwidth_works=yes
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.17.1
