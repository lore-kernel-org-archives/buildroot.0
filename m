From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 22:15:07 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/freeswitch: needs speexdsp
In-Reply-To: <20180610201509.30546-1-bernd.kuhls@t-online.de>
References: <20180610201509.30546-1-bernd.kuhls@t-online.de>
Message-ID: <20180610201509.30546-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/a3f/a3f9845681025fad93a4f867bb667822e87a08ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/freeswitch/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 1f6459335d..ff2898dc3c 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_FREESWITCH
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_SPEEXDSP
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-- 
2.17.1
