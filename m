From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 00:05:18 +0200
Subject: [Buildroot] [git commit] vorbis-tools: add license info
Message-ID: <20131001220629.DA5E29B8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e7840ca5abdda41a039a709467b5f97b88f8097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vorbis-tools/vorbis-tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index 56b1f94..464081e 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -6,6 +6,8 @@
 
 VORBIS_TOOLS_VERSION = 1.4.0
 VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
+VORBIS_TOOLS_LICENSE = GPLv2
+VORBIS_TOOLS_LICENSE_FILES = COPYING
 VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
 VORBIS_TOOLS_CONF_OPT = --program-transform-name=''
 
