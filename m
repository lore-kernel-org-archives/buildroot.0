From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:17:42 +0100
Subject: [Buildroot] [git commit] package/kodi-skin-confluence: bump version
 to 3.1.47
Message-ID: <20180107144905.A4A3F802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0c776b37df3e4bd9b87b42cc63a38cbd7eea9c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 276b000..2dabbbd 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 49ae60f397e3cac08dc0e9c027bc39a3936ccd27b956d7a43bf2424a07f162ec  kodi-skin-confluence-96bed03570a90d4fdfb96ab71de9a51ceedd03fb.tar.gz
+sha256 1fa8ebeec269e678111f64bec373d98e34b4ba1b32e583a505431b2562910ba0  kodi-skin-confluence-37bba429adc16d49a07add08de406682e1cc673a.tar.gz
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index a5ebcf5..e9cdf3f 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_SKIN_CONFLUENCE_VERSION = 96bed03570a90d4fdfb96ab71de9a51ceedd03fb
+KODI_SKIN_CONFLUENCE_VERSION = 37bba429adc16d49a07add08de406682e1cc673a
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
