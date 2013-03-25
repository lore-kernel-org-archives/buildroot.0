From: arved at arved.at <arved@arved.at>
Date: Mon, 25 Mar 2013 15:48:13 +0100
Subject: [Buildroot] [PATCH 4/4] Enable feature CONFIG_FEATURE_PIDFILE so
	that the syslog initscript actually works
In-Reply-To: <1364222893-23858-1-git-send-email-arved@arved.at>
References: <1364222893-23858-1-git-send-email-arved@arved.at>
Message-ID: <1364222893-23858-4-git-send-email-arved@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tilman Keskin?z <arved@arved.at>


Signed-off-by: Tilman Keskin?z <arved@arved.at>
---
 package/busybox/busybox-1.20.x.config |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox-1.20.x.config b/package/busybox/busybox-1.20.x.config
index 5525434..d199996 100644
--- a/package/busybox/busybox-1.20.x.config
+++ b/package/busybox/busybox-1.20.x.config
@@ -41,7 +41,7 @@ CONFIG_FEATURE_DEVPTS=y
 CONFIG_FEATURE_CLEAN_UP=y
 CONFIG_FEATURE_UTMP=y
 CONFIG_FEATURE_WTMP=y
-# CONFIG_FEATURE_PIDFILE is not set
+CONFIG_FEATURE_PIDFILE=y
 CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_SUID_CONFIG is not set
 # CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
-- 
1.7.10.4
