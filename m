From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 09:37:34 -0300
Subject: [Buildroot] [PATCH] uclibc: enable UCLIBC_HAS_UTMP in snapshot
	configuration
Message-ID: <1429101454-26556-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise busybox in the default configuration fails to build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uClibc-snapshot.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 6f5ebfa..ac3d9b0 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -237,6 +237,7 @@ UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
+UCLIBC_HAS_UTMP=y
 UCLIBC_HAS_UTMPX=y
 
 #
-- 
2.0.5
