From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Oct 2014 20:30:55 -0300
Subject: [Buildroot] [PATCH 1/3] skeleton/etc/profile: remove /usr/bin/X11
	from PATH
Message-ID: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That directory has been unused for ages so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/profile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 31d3180..640f6f1 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -5,7 +5,6 @@ export PATH=\
 /sbin:\
 /usr/bin:\
 /usr/sbin:\
-/usr/bin/X11:\
 /usr/local/bin
 
 # If running interactively, then:
-- 
2.0.4
