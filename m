From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Aug 2016 22:49:13 +0200
Subject: [Buildroot] [git commit] alljoyn: bump to version 16.04a
Message-ID: <20160902142941.7F8D17FA6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d340eb39953d35048c030e1602b026f46734c9b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alljoyn/alljoyn.hash | 2 +-
 package/alljoyn/alljoyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alljoyn/alljoyn.hash b/package/alljoyn/alljoyn.hash
index e18d66e..47dd0d4 100644
--- a/package/alljoyn/alljoyn.hash
+++ b/package/alljoyn/alljoyn.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	41bd424d376d22dc2b48cc035400bd63595d19467eeb6a7ae81429f5a43ed2e2	alljoyn-16.04.00-src.tar.gz
+sha256	fc437d96cf1213f18048240b5d12a374b31894d21830a0a6ccf562ffa13425d5	alljoyn-16.04.00a-src.tar.gz
diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
index 7126258..69d5ded 100644
--- a/package/alljoyn/alljoyn.mk
+++ b/package/alljoyn/alljoyn.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ALLJOYN_REV = 16.04
-ALLJOYN_VERSION = $(ALLJOYN_REV).00
+ALLJOYN_VERSION = $(ALLJOYN_REV).00a
 ALLJOYN_SOURCE = alljoyn-$(ALLJOYN_VERSION)-src.tar.gz
 ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
 # See https://allseenalliance.org/alliance/ip-policy
