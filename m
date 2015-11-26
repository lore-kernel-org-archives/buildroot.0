From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:38:14 +0100
Subject: [Buildroot] [git commit] gstreamer: add legal info
Message-ID: <20151126214030.24D027FB04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a32ca7668ad80ad55c0651c0066ffd9cde0d8099
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though COPYING is LGPLv2+ many code files state v2.1+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index cc035c0..f2bde30 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -8,6 +8,9 @@ GSTREAMER_VERSION = 0.10.36
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
+# COPYING is in fact v2, but most of the code is v2.1+
+GSTREAMER_LICENSE = LGPLv2.1+
+GSTREAMER_LICENSE_FILES = COPYING
 
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
