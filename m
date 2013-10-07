From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 11:48:28 +0200
Subject: [Buildroot] [git commit] smartmontools: bump to version 6.2
Message-ID: <20131007095748.01F629B978@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b953d79b62ae75950349ea6575fe8ee9b895f0c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smartmontools/smartmontools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index fb9fb3c..903ed47 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 6.1
+SMARTMONTOOLS_VERSION = 6.2
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPLv2+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
