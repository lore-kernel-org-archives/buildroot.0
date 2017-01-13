From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 12 Jan 2017 21:13:01 -0500
Subject: [Buildroot] [PATCH 1/1] mkpasswd: remove dash from "host mkpasswd"
	to match other host tools
Message-ID: <1484273581-2327-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
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
-- 
1.9.1
