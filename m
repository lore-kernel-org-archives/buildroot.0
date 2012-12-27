From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Dec 2012 12:39:06 -0300
Subject: [Buildroot] [PATCH 2/6] iw: bump to version 3.8
In-Reply-To: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356622750-20657-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356622750-20657-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 19ede3a..22ea25c 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 3.7
+IW_VERSION = 3.8
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_LICENSE = iw license
-- 
1.7.8.6
