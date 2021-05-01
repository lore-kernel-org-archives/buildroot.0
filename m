From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 16:50:00 +0200
Subject: [Buildroot] [git commit] package/s6-linux-init: bump to version
 1.0.6.3
Message-ID: <20210501144021.8FE0C814CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=643b03b62fd27920a406fb5db8709d705036c9f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-linux-init/s6-linux-init.hash | 2 +-
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 5f3a8d41b8..23f02d5359 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  16f6c84f3c4825ca8b244b89693569d8f69db98c485bd958301a079586f2086b  s6-linux-init-1.0.6.1.tar.gz
+sha256  29e368516b1a3c61a6d1f8680645cc122a2e02127debec91738f170a3b93b8c5  s6-linux-init-1.0.6.3.tar.gz
 sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index efd4984085..2030ca7820 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.6.1
+S6_LINUX_INIT_VERSION = 1.0.6.3
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
