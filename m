From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 12:00:12 +0200
Subject: [Buildroot] [git commit] ortp: bump to version 0.22.0
Message-ID: <20131007100135.00AE29B975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=280a387737ed72a2dd844253eeb64cc373ca7656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ortp/ortp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 5ccc5ff..513be9b 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.20.0
+ORTP_VERSION = 0.22.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 ORTP_CONF_OPT = --disable-strict
 ORTP_INSTALL_STAGING = YES
