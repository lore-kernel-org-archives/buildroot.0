From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Oct 2017 17:54:59 +0200
Subject: [Buildroot] [git commit] cryptsetup: fix host package option text
Message-ID: <20171010155054.255E880DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14aff36717fc7a5a642cbc061e47d86e0bd7bdbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host packages are called 'host foo', not 'host-foo'.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptsetup/Config.in.host b/package/cryptsetup/Config.in.host
index 7060ed1..9e31df5 100644
--- a/package/cryptsetup/Config.in.host
+++ b/package/cryptsetup/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_CRYPTSETUP
-	bool "host-cryptsetup"
+	bool "host cryptsetup"
 	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
