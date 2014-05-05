From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 21:49:19 +0200
Subject: [Buildroot] [git commit] lcdproc: bump version to 0.5.7
Message-ID: <20140505200037.6B6429CB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=687615cb587c77b041b03fa259ffaafd0763c5cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcdproc/lcdproc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index dfd7f7f..2f19a3e 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCDPROC_VERSION = 0.5.6
+LCDPROC_VERSION = 0.5.7
 LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPLv2+
 LCDPROC_LICENSE_FILES = COPYING
