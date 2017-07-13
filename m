From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 10:54:39 +0200
Subject: [Buildroot] [git commit] python-incremental: add host variant
Message-ID: <20170713085046.AFBF982151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd3a3f604ee7d4ab296e1f2ef203f926706a5e50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host variant of the python-incremental package will be needed for
the python-treq package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-incremental/python-incremental.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 64eda68..fc1975f 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -12,3 +12,4 @@ PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
