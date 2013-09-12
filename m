From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 21:56:10 -0300
Subject: [Buildroot] [PATCH 2/5] dosfstools: bump to version 3.0.22
In-Reply-To: <1378947373-4767-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378947373-4767-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378947373-4767-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/dosfstools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index d6ecb6f..c94f680 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.20
+DOSFSTOOLS_VERSION = 3.0.22
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
-- 
1.8.1.5
