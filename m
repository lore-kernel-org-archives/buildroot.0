From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 23:37:04 +0200
Subject: [Buildroot] [git commit] mtr: drop unneeded 'call' from
	autotools-package invocation
Message-ID: <20140515214016.E72799CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=916852c3b2c542d42e5fe80168b1f7542e440ecf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtr/mtr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index a96bf0c..19dfc48 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -21,4 +21,4 @@ endif
 
 MTR_POST_PATCH_HOOKS += MTR_DISABLE_RES_NINIT
 
-$(eval $(call autotools-package))
+$(eval $(autotools-package))
