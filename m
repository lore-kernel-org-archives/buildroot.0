From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:45:01 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/diffutils: add
 host package
Message-ID: <20210320162650.DFC5E87950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b25bcdb131445d1494adac221a605994875e0564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 819637e0e977493bcb176a82981b6916aeca8793)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
