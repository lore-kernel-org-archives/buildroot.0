From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 28 Oct 2015 17:09:00 +0100
Subject: [Buildroot] [PATCH] skeleton: add "operator" group
Message-ID: <1446048540-25164-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gid 37 was referenced in /etc/passwd but not in /etc/group

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 system/skeleton/etc/group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index ba20e90..c813da2 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -16,6 +16,7 @@ video:x:28:
 audio:x:29:
 tape:x:32:
 www-data:x:33:
+operator:x:37:
 utmp:x:43:
 plugdev:x:46:
 staff:x:50:
-- 
2.1.4
