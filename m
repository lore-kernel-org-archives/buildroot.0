From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:46:22 +0200
Subject: [Buildroot] [git commit] package/swig: define SWIG pointing to the
	host swig program
Message-ID: <20141005114629.60031B046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e07296cb9947b18cf24ec980f313d1606485da0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swig/swig.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 9996e95..3ef56d6 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -31,3 +31,5 @@ endef
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
 
 $(eval $(host-autotools-package))
+
+SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
