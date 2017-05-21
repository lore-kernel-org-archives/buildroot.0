From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 16:56:16 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/alsa-utils: bump version to
	1.1.4
In-Reply-To: <20170521145616.20380-1-bernd.kuhls@t-online.de>
References: <20170521145616.20380-1-bernd.kuhls@t-online.de>
Message-ID: <20170521145616.20380-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index 1add17e08..538990bde 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 127217a54eea0f9a49700a2f239a2d4f5384aa094d68df04a8eb80132eb6167c  alsa-utils-1.1.3.tar.bz2
+sha256 a7831044de92c5bf33bf3365a3f36e49397f4191e934df460ae1ca15138c9d9d  alsa-utils-1.1.4.tar.bz2
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 847a97f64..f0b964aff 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.1.3
+ALSA_UTILS_VERSION = 1.1.4
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.11.0
