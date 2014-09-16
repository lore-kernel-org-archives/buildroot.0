From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Sep 2014 10:23:32 -0300
Subject: [Buildroot] [PATCH 2/2] p11-kit: bump to version 0.20.6
In-Reply-To: <1410873812-5695-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410873812-5695-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410873812-5695-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/p11-kit/p11-kit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 9e210bb..5724a1c 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.20.2
+P11_KIT_VERSION = 0.20.6
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
 P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
-- 
1.8.5.5
