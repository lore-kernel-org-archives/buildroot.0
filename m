From: Stephan Hoffmann <sho@relinux.de>
Date: Fri,  7 Dec 2012 11:12:36 +0100
Subject: [Buildroot] [PATCH] fbv: add license info
Message-ID: <1354875156-28654-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
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
-- 
1.7.0.4
