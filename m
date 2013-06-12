From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 22:29:53 +0200
Subject: [Buildroot] [git commit] sdparm: bump to version 1.08
Message-ID: <20130612203719.240CF9AD48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df13ceb90c59f6bbe13c9f5fda5725a627dde941
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdparm/sdparm.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index ef30887..1b3ec4b 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -1,6 +1,12 @@
-SDPARM_VERSION = 1.07
+################################################################################
+#
+# sdparm
+#
+################################################################################
+
+SDPARM_VERSION = 1.08
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
-SDPARM_SITE = http://sg.danny.cz/sg/p/
+SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3c
 SDPARM_LICENSE_FILES = COPYING
 
