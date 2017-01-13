From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:09:22 +0100
Subject: [Buildroot] [git commit] mkpasswd: remove dash from "host mkpasswd"
	to match other host tools
Message-ID: <20170113152114.3E94D7F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b8c1248832c0d292bb2cdcff068055c67bf6fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mkpasswd/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mkpasswd/Config.in.host b/package/mkpasswd/Config.in.host
index fb5bc80..93774bd 100644
--- a/package/mkpasswd/Config.in.host
+++ b/package/mkpasswd/Config.in.host
@@ -1,2 +1,2 @@
 config BR2_PACKAGE_HOST_MKPASSWD
-	bool "host-mkpasswd"
+	bool "host mkpasswd"
