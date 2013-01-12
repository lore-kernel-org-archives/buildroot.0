From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 21:00:51 +0100
Subject: [Buildroot] [git commit] arptables: bump to version 0.0.4
Message-ID: <20130112200214.7CF949983C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b98b094aa182b110deec122969bd53d4bda8cb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/arptables/arptables.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index dac5ca4..bf68670 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-ARPTABLES_VERSION = 0.0.3
-ARPTABLES_VERSION_MINOR = 4
-ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION)-$(ARPTABLES_VERSION_MINOR).tar.gz
+ARPTABLES_VERSION = 0.0.4
+ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION).tar.gz
 ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
+ARPTABLES_LICENSE = GPLv2+
 
 define ARPTABLES_BUILD_CMDS
 	$(MAKE) -C $(@D) \
