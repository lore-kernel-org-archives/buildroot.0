From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:27:57 +0200
Subject: [Buildroot] [git commit] package/freeswitch: needs speexdsp
Message-ID: <20180616122621.3F54E8856E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba8805fe8e5307025fc8120a29b3bd4f23f3590d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/a3f/a3f9845681025fad93a4f867bb667822e87a08ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
