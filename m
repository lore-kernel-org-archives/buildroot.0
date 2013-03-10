From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 21:27:50 +0100
Subject: [Buildroot] [git commit] cmake: remove target package macro
Message-ID: <20130310203045.2367A9AF86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cea14a589a1632cbf16af9192c18a72d8b89790d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dummy target package is not needed anymore since commit 79bfcd556027901.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cmake/cmake.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d0db502e..cfe8ab4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -25,5 +25,4 @@ define HOST_CMAKE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(generic-package))
 $(eval $(host-generic-package))
