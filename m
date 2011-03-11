From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:28 +0800
Subject: [Buildroot] [PATCH 2/9] alsa-utils : bump to 1.0.24.2
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-2-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/multimedia/alsa-utils/alsa-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 4ab49d3..26c270b 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -3,7 +3,7 @@
 # alsa-utils
 #
 #############################################################
-ALSA_UTILS_VERSION = 1.0.23
+ALSA_UTILS_VERSION = 1.0.24.2
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_INSTALL_STAGING = YES
-- 
1.7.0.4
