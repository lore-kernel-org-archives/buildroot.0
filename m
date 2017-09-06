From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 13:14:05 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/squid: fix typo
Message-ID: <20170906112608.448558211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21d7b1e4fc2000ae98b9fa41d635f238e3e43e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixed typo added by
https://git.buildroot.net/buildroot/commit/package/squid?id=d2f7d0d72cd7e00ffbe869011d200f0a4a53e7a5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7c5526c79cd74592cff55f8344216ad0a968119a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index cf0378a..9abf3cd 100644
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
