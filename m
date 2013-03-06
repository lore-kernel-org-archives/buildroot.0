From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Mar 2013 18:14:23 +0100
Subject: [Buildroot] [PATCH 2/5] cmake: remove target package macro (not
	really implemented)
In-Reply-To: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1362590066-5448-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CMake is declared as a generic target package, but the corresponding rules
do not even exist.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/cmake/cmake.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d0db502e..cfe8ab4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -25,5 +25,4 @@ define HOST_CMAKE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
1.7.10.4
