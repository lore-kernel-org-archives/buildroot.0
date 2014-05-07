From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 10:10:28 +0200
Subject: [Buildroot] [git commit] dsp-tools: add license information
Message-ID: <20140507120710.8934D9CB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a834c80d8e57d16d183bd74be002a69f20445f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dsp-tools/dsp-tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index d5f562d..c9f432c 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -7,6 +7,8 @@
 DSP_TOOLS_VERSION = 2.0
 DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files/
 DSP_TOOLS_DEPENDENCIES = tidsp-binaries
+DSP_TOOLS_LICENSE = LGPLv2.1
+DSP_TOOLS_LICENSE_FILES = LICENSE
 
 define DSP_TOOLS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
