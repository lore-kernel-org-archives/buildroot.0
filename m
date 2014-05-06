From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:36 -0500
Subject: [Buildroot] [PATCH 01/11] dsp-tools: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/dsp-tools/dsp-tools.mk |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
