From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:52:27 +0200
Subject: [Buildroot] [git commit] cgilua: bump rockspec revision
Message-ID: <20140419215315.ED5A69C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bfb9f207be59c841d1fc298241ce552a86d9786
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgilua/cgilua.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index bdb1411..5934ffd 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.1.4-1
+CGILUA_VERSION = 5.1.4-2
 CGILUA_LICENSE = MIT
 
 $(eval $(luarocks-package))
