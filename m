From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:02:19 +0200
Subject: [Buildroot] [git commit] isl: add explicit dependencies for host
	variant
Message-ID: <20160703071146.3D2717FE29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ebc214d7fafdb45fb2468bcf90759350b5e160f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/isl/isl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index bb79039..74de125 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -12,7 +12,7 @@ ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
-ISL_DEPENDENCIES = gmp
+HOST_ISL_DEPENDENCIES = host-gmp
 
 # Our libtool patch doesn't apply, and since this package is only
 # built for the host, we don't really care about it.
