From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] cloog: add explicit dependencies for host
	variant
Message-ID: <20160703064348.777267FE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4a184d15edeca75435cbaac0337e4c2bd167ea7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloog/cloog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index 4c8b4c1..ef666d0 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -7,7 +7,7 @@
 CLOOG_VERSION = 0.18.4
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
 CLOOG_LICENSE = LGPLv2.1+
-CLOOG_DEPENDENCIES = gmp isl
+HOST_CLOOG_DEPENDENCIES = host-gmp host-isl
 # Our libtool patch doesn't apply, and since this package is only
 # built for the host, we don't really care about it.
 CLOOG_LIBTOOL_PATCH = NO
