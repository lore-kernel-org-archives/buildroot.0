From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 16:28:54 +0200
Subject: [Buildroot] [git commit] package/kodi-audiodecoder-timidity: bump
 version to 2.0.5-Leia
Message-ID: <20200329141529.5A66E88DCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3110dd8a810424d78eb1e11d03a5d951a270b33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash | 4 ++--
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index d944584d9e..b4c9c36045 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3ddd560b1c907f092f30e51dfc1f0b19e3cf77071fa557cb949d6fc3d9133497  kodi-audiodecoder-timidity-2.0.4-Leia.tar.gz
-sha256 66792d1a5f4c47fbe593c0edfcd58af168a1e9c09ea3ca5b741ea170197638c2  debian/copyright
+sha256 b20a3a23056aaf76c216c755f36dff03e943d7c086d3e3fca4c920b93113e073  kodi-audiodecoder-timidity-2.0.5-Leia.tar.gz
+sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index fecd1342b3..a4f0126c43 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 2.0.4-Leia
+KODI_AUDIODECODER_TIMIDITY_VERSION = 2.0.5-Leia
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
