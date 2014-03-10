From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:28 -0300
Subject: [Buildroot] [PATCH 08/14] netatalk: bump to version 3.0.8
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netatalk/netatalk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 2bd63ec..e5e5c6b 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.0.5
+NETATALK_VERSION = 3.0.8
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 NETATALK_AUTORECONF = YES
-- 
1.8.3.2
