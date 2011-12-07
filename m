From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 21:47:53 +0100
Subject: [Buildroot] [git commit] ebtables: bump to version 2.0.10-3
Message-ID: <20111207213522.AEFC98F8BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cbb85c15065aa02c425747c4d5df15c1934fd33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ebtables/ebtables.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 6cfdfdc..b29c462 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -3,7 +3,8 @@
 # ebtables
 #
 #############################################################
-EBTABLES_VERSION = 2.0.10-1
+
+EBTABLES_VERSION = 2.0.10-3
 EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
 
