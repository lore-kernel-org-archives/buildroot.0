From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:43 -0500
Subject: [Buildroot] [PATCH 08/11] tidsp-binaries: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-9-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/tidsp-binaries/tidsp-binaries.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
index 274d71c..12e7160 100644
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -6,6 +6,8 @@
 
 TIDSP_BINARIES_VERSION = 23.i3.8
 TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files/
+TIDSP_BINARIES_LICENSE = TI Proprietary License
+TIDSP_BINARIES_LICENSE_FILES = LICENSE
 
 define TIDSP_BINARIES_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
-- 
1.7.9.5
