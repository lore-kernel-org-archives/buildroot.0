From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] fbdump: remove --program-prefix
Message-ID: <20110912052634.2849B8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9bbc3f76330b4b97dc3f01d69a71695da66febb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbdump/fbdump.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index eb74d8b..521b0fd 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -7,7 +7,6 @@ FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_AUTORECONF = NO
-FBDUMP_CONF_OPT = --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,fbdump))
 
-- 
1.7.3.4
