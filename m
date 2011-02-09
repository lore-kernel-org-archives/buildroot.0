From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Feb 2011 10:25:51 -0300
Subject: [Buildroot] [PATCH 3/5] squid: bump to version 3.1.11
In-Reply-To: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1297257953-8381-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many small fixes, see
http://www.squid-cache.org/Versions/v3/3.1/changesets/SQUID_3_1_11.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3afa07d..e410bd1 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.1.10
+SQUID_VERSION = 3.1.11
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
 SQUID_DEPENDENCIES = libcap host-libcap
 SQUID_AUTORECONF = YES
-- 
1.7.3.4
