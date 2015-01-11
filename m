From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 11 Jan 2015 09:25:31 +0100
Subject: [Buildroot] [PATCH] dtc: update source url
Message-ID: <1420964731-10432-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The url of the git repository is changed so use the updated one.

This fix the error:

fatal: unable to connect to git.jdl.com:
git.jdl.com[0: 208.123.73.151]: errno=Connection refused

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/dtc/dtc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 51b5b4e..ba1280e 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 DTC_VERSION = v1.4.0
-DTC_SITE = git://git.jdl.com/software/dtc.git
+DTC_SITE = https://git.kernel.org/pub/scm/utils/dtc/dtc.git
+DTC_SITE_METHOD = git
 DTC_LICENSE = GPLv2+/BSD-2c
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-- 
2.1.0
