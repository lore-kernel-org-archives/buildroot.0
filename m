From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 13:31:38 -0300
Subject: [Buildroot] [PATCH 3/3] olsr: bump to version 0.6.6
In-Reply-To: <1379435498-1598-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379435498-1598-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379435498-1598-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/olsr/olsr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 9532612..f96e570 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OLSR_VERSION_MAJOR = 0.6
-OLSR_VERSION_MINOR = 4
+OLSR_VERSION_MINOR = 6
 OLSR_VERSION = $(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
-- 
1.8.1.5
