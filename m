From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:00:03 -0300
Subject: [Buildroot] [PATCH 4/4] squid: bump to version 3.3.2
In-Reply-To: <1362412803-11393-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362412803-11393-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362412803-11393-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7cae0be..a4093f4 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.2.7
-SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
+SQUID_VERSION = 3.3.2
+SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
-- 
1.7.12.4
