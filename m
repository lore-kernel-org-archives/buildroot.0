From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:26:01 +0200
Subject: [Buildroot] [git commit] package/squid: fix typo
Message-ID: <20170829211840.C190381E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c5526c79cd74592cff55f8344216ad0a968119a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed typo added by
https://git.buildroot.net/buildroot/commit/package/squid?id=d2f7d0d72cd7e00ffbe869011d200f0a4a53e7a5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index bcb3744..d334d14 100644
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
