From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 11:33:44 +0100
Subject: [Buildroot] [git commit] fbv: add license info
Message-ID: <20121216105435.1CF0F9A1E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bd01ac2bfc9617821e0e923acef83f7608d0507
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbv/fbv.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 7949e99..f697fe8 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -7,6 +7,9 @@ FBV_VERSION:=1.0b
 FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
 FBV_SITE:=http://s-tech.elsat.net.pl/fbv
 
+FBV_LICENSE = GPLv2
+FBV_LICENSE_FILES = COPYING
+
 ### image format dependencies and configure options
 FBV_DEPENDENCIES = # empty
 FBV_CONFIGURE_OPTS = # empty
