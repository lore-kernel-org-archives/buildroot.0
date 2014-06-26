From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:21 -0300
Subject: [Buildroot] [PATCH 53/53] xvkvd: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-53-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xvkbd/xvkbd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 15aa940..9d73590 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -6,6 +6,8 @@
 
 XVKBD_VERSION = 3.2
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
+XVKBD_LICENSE = GPLv2+
+XVKBD_LICENSE_FILES = xvkbd.c
 
 # Passing USRLIBDIR ensures that the stupid Makefile doesn't add
 # /usr/lib to the library search path.
-- 
1.8.5.5
