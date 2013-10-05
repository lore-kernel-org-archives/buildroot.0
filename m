From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:10:56 +0200
Subject: [Buildroot] [git commit] proxychains-ng: bump to version 4.6
Message-ID: <20131005191321.81E4C9B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fef1e5d5df8f2410a4f6250c4b6854871480233
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proxychains-ng/proxychains-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index cc3e357..7c2ffbf 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROXYCHAINS_NG_VERSION = 4.4
+PROXYCHAINS_NG_VERSION = 4.6
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 
