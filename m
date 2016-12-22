From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:50:52 +0100
Subject: [Buildroot] [git commit] alsa-utils: bump to version 1.1.3
Message-ID: <20161222095058.F288380DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6b447f3565835620647ca3c8e3f770080319cb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index c2c089f..1add17e 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7af603c0877d1251599d65b4fbc372e63a54371b888f5c26c6a86ac1d0519071  alsa-utils-1.1.2.tar.bz2
+sha256 127217a54eea0f9a49700a2f239a2d4f5384aa094d68df04a8eb80132eb6167c  alsa-utils-1.1.3.tar.bz2
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index fc2ac16..9113b8d 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.2
+ALSA_UTILS_VERSION = 1.1.3
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPLv2
