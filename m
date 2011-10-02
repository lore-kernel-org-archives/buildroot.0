From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Oct 2011 20:57:35 +0200
Subject: [Buildroot] [git commit] smartmontools: bump to version 5.41
Message-ID: <20111002191514.8391B8E04A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4773c05628da483bb847d7f571c893084ad76f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/smartmontools/smartmontools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d941504..d14e740 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SMARTMONTOOLS_VERSION = 5.40
+SMARTMONTOOLS_VERSION = 5.41
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 
 $(eval $(call AUTOTARGETS))
