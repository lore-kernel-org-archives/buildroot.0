From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Aug 2017 21:28:51 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/opus: bump version to 1.2.1
Message-ID: <20170830192853.24222-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch upstream URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 7349ec4b7..32fe2e245 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	9122b6b380081dd2665189f97bfd777f04f92dc3ab6698eea1dbb27ad59d8692	opus-1.1.4.tar.gz
+sha256 cfafd339ccd9c5ef8d6ab15d7e1a412c054bf4cb4ecbbbcc78c12ef2def70732  opus-1.2.1.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index b810b7787..44de5db25 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.1.4
-OPUS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_VERSION = 1.2.1
+OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
-- 
2.11.0
