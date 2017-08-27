From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Aug 2017 15:43:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/squid: fix typo
Message-ID: <20170827134336.6698-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed typo added by
https://git.buildroot.net/buildroot/commit/package/squid?id=d2f7d0d72cd7e00ffbe869011d200f0a4a53e7a5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index bcb3744de..d334d14c8 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,7 +21,7 @@ SQUID_CONF_ENV = \
 	ac_cv_func___va_copy=yes \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
-	BUILXCXX="$(HOSTCXX)" \
+	BUILDCXX="$(HOSTCXX)" \
 	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
-- 
2.11.0
