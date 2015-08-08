From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:04 -0000
Subject: [Buildroot] [git commit branch/next] dado: bump to version 1.6.0
Message-ID: <20150808105603.7C62F7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94adefb19d2686f007effa1fda7bbb84563c0165
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dado/dado.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index 3a58215..a09dd6d 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DADO_VERSION = 1.5.2-1
+DADO_VERSION = 1.6.0-1
 DADO_LICENSE = MIT
 
 $(eval $(luarocks-package))
