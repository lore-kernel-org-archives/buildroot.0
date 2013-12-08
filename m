From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 20:57:57 +0100
Subject: [Buildroot] [git commit] libevent: add host variant
Message-ID: <20131208203406.422EE9BF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5325b6c1d855c7b6a4122071f0d9ca786269b6f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index a6def1a..14ebf72 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -20,3 +20,4 @@ LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
