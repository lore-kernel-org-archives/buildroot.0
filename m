From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:50:14 +0200
Subject: [Buildroot] [git commit] package/kodi-skin-confluence: bump version
	to 3.1.4
Message-ID: <20170926215334.2BD34807DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e8ce1eccc2477f2046e2aeaf93bf4f4986c5ad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version was not tagged upstream so use a git hash which has that
version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 9aa2ea4..276b000 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 47970d61b2f617921dfbc36188ed11de9af366cd97d9105e19cbe96598fe7b62  kodi-skin-confluence-7044dabb3a818d7ff47b7a34bfb3480f2a9441d9.tar.gz
+sha256 49ae60f397e3cac08dc0e9c027bc39a3936ccd27b956d7a43bf2424a07f162ec  kodi-skin-confluence-96bed03570a90d4fdfb96ab71de9a51ceedd03fb.tar.gz
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index e7ed11c..a5ebcf5 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = 7044dabb3a818d7ff47b7a34bfb3480f2a9441d9
+# This cset is on the branch 'krypton'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_SKIN_CONFLUENCE_VERSION = 96bed03570a90d4fdfb96ab71de9a51ceedd03fb
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
