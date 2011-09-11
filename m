From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] netcat: remove --program-prefix
Message-ID: <20110912052633.EFD9F8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=98304cb6a8cb4358f3d53e69fc4edc650ec26d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netcat/netcat.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index f8263ef..31f6b71 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -10,6 +10,5 @@ NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netc
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
-NETCAT_CONF_OPT = --program-prefix=''
 
 $(eval $(call AUTOTARGETS,package,netcat))
-- 
1.7.3.4
