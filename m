From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:39 -0300
Subject: [Buildroot] [PATCH 7/7] bind: bump to version 9.6-ESV-R7
In-Reply-To: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337779779-1783-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 987bd4e..eb7b9c0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R6
+BIND_VERSION = 9.6-ESV-R7
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
-- 
1.7.3.4
