From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:22:11 +0200
Subject: [Buildroot] [git commit] picocom: add license info
Message-ID: <20131001192230.464B79A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22ea98e727fd6ac2430c4a8f904511322743f43c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picocom/picocom.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 8f8ad20..f6c423a 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -6,6 +6,8 @@
 
 PICOCOM_VERSION = 1.7
 PICOCOM_SITE    = http://picocom.googlecode.com/files/
+PICOCOM_LICENSE = GPLv2+
+PICOCOM_LICENSE_FILES = LICENSE.txt
 
 define PICOCOM_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
