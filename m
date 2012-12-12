From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Dec 2012 15:21:25 -0300
Subject: [Buildroot] [PATCH 2/2] squid: bump to version 3.2.5
In-Reply-To: <1355336485-22792-1-git-send-email-gustavo@zacarias.com.ar>
References: <1355336485-22792-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1355336485-22792-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3c08c39..43e2d24 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.2.4
+SQUID_VERSION = 3.2.5
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
-- 
1.7.8.6
