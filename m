From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:24:12 +0100
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: bump version
	to 3.2.1
Message-ID: <20161127213918.F3E8F81908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ce49353422b76f28d6e0c7166e3b98b8c089434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 541f421..aa9f0f7 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 88f70c1b8cab108f494ecbab5ba302cdb35d59a84cea88008b5fe49be068d5da  ffmpeg-3.2.tar.xz
+sha256 1ecf93da5d601e6fb3096c65cbe33fdaf042d690a3c50c4efadb0a9b74f2badf  ffmpeg-3.2.1.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index de6d841..699de2a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2
+FFMPEG_VERSION = 3.2.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
