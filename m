From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] lzop: remove --program-prefix
Message-ID: <20110912052633.9F2EE8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2caafe6be7bc61569317a35b4b36880c7c6761b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzop/lzop.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 796686a..e55c105 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -6,7 +6,6 @@
 LZOP_VERSION:=1.02rc1
 LZOP_SOURCE:=lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE:=http://www.lzop.org/download/
-LZOP_CONF_OPT:=--program-prefix=""
 LZOP_DEPENDENCIES:=lzo
 
 $(eval $(call AUTOTARGETS,package,lzop))
-- 
1.7.3.4
