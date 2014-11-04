From: Pedro Aguilar <paguilar@paguilar.org>
Date: Wed,  5 Nov 2014 00:28:28 +0100
Subject: [Buildroot] [PATCH v3 3/4] libunistring: Add host-autotools-package
In-Reply-To: <1415143709-10963-1-git-send-email-paguilar@paguilar.org>
References: <1415143709-10963-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1415143709-10963-4-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-libunistring is needed by guile

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v1 -> v2:
- Add host-libunistring (suggested by Yann Morin)

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/libunistring/libunistring.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 3234ddc..fd77d12 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -17,3 +17,4 @@ LIBUNISTRING_CONF_OPTS += --disable-threads
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
