From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Aug 2019 08:51:38 +0200
Subject: [Buildroot] [git commit] package/libmodplug: bump version to 0.8.9
Message-ID: <20190825064840.0809F82288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=661949b3f5e08aed9f0240d872bbb14d9aa12d34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for security bump of vlc to 3.0.8:
http://git.videolan.org/?p=vlc/vlc-3.0.git;a=commitdiff;h=48f014768dc22ecad23d0e9f53c38805a3aff832

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodplug/libmodplug.hash | 2 +-
 package/libmodplug/libmodplug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodplug/libmodplug.hash b/package/libmodplug/libmodplug.hash
index d50a56eeda..e75152e27f 100644
--- a/package/libmodplug/libmodplug.hash
+++ b/package/libmodplug/libmodplug.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  77462d12ee99476c8645cb5511363e3906b88b33a6b54362b4dbc0f39aa2daad  libmodplug-0.8.8.5.tar.gz
+sha256  457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de  libmodplug-0.8.9.0.tar.gz
 sha256  49942e7b3b175f549e751feb08b5270ca6f6c5fb7a1be9f9517db275ec32c92e  COPYING
diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index d9d74df50c..05786ce812 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODPLUG_VERSION = 0.8.8.5
+LIBMODPLUG_VERSION = 0.8.9.0
 LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
