From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:38:17 +0200
Subject: [Buildroot] [git commit] wpan-tools: correct license name
Message-ID: <20170401203935.A173A80125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b954e2f98f8a02ab587e5a8aa57c13966a99813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iw license is ISC.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpan-tools/wpan-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpan-tools/wpan-tools.mk b/package/wpan-tools/wpan-tools.mk
index d223800..012b946 100644
--- a/package/wpan-tools/wpan-tools.mk
+++ b/package/wpan-tools/wpan-tools.mk
@@ -7,7 +7,7 @@
 WPAN_TOOLS_VERSION = 0.5
 WPAN_TOOLS_SITE = http://wpan.cakelab.org/releases
 WPAN_TOOLS_DEPENDENCIES = host-pkgconf libnl
-WPAN_TOOLS_LICENSE = iw license
+WPAN_TOOLS_LICENSE = ISC
 WPAN_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
