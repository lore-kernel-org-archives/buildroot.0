From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  6 Mar 2014 17:54:49 +0100
Subject: [Buildroot] [PATCH 1/2] system/skeleton: add mail group
In-Reply-To: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1394124890-29254-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 system/skeleton/etc/group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 864d1db..85a1fa2 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -6,6 +6,7 @@ adm:x:4:
 tty:x:5:
 disk:x:6:
 lp:x:7:
+mail:x:8:
 kmem:x:9:
 wheel:x:10:root
 cdrom:x:11:
-- 
1.8.3.2
