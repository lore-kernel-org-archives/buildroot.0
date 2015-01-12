From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Jan 2015 08:17:16 -0300
Subject: [Buildroot] [PATCH] libcurl: drop curl* aliases
Message-ID: <1421061436-8322-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They're unused hence not useful.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index db5fdb7..014c5e3 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -67,8 +67,3 @@ LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
 $(eval $(autotools-package))
-
-curl: libcurl
-curl-clean: libcurl-clean
-curl-dirclean: libcurl-dirclean
-curl-source: libcurl-source
-- 
2.0.5
