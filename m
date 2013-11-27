From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Nov 2013 13:56:28 +0100
Subject: [Buildroot] [git commit] libnss: security bump to version 3.14.5
Message-ID: <20131127213147.758E09BD91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51b3db5eaa1aba458daa7de19b7bd2c42a9bafb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-5605.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9989b6d..002e083 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.14.3
+LIBNSS_VERSION = 3.14.5
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src
