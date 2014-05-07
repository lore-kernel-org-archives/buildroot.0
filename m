From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 13:43:04 +0200
Subject: [Buildroot] [git commit] tidsp-binaries: add license information
Message-ID: <20140507120710.CDE0B9CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d86cfe873cc43161da368704b2d5e6e5b04c897
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tidsp-binaries/tidsp-binaries.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
