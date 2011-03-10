From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2011 09:25:03 -0300
Subject: [Buildroot] [PATCH 2/3] xz: bump to version 5.0.1
In-Reply-To: <1299759904-22003-1-git-send-email-gustavo@zacarias.com.ar>
References: <1299759904-22003-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1299759904-22003-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index dfc0638..1d8c7ee 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -3,7 +3,7 @@
 # xz-utils
 #
 #############################################################
-XZ_VERSION = 5.0.0
+XZ_VERSION = 5.0.1
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
-- 
1.7.3.4
