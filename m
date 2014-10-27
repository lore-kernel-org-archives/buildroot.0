From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 15:18:56 -0300
Subject: [Buildroot] [PATCH 3/8] system/skeleton: drop backup user
In-Reply-To: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414433941-5778-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AFAIK no package uses it and even if it did it would belong there.
And it's not a standard user either.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/passwd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index 46e239f..2e7e77a 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -6,7 +6,6 @@ sync:x:4:100:sync:/bin:/bin/sync
 mail:x:8:8:mail:/var/spool/mail:/bin/sh
 proxy:x:13:13:proxy:/bin:/bin/sh
 www-data:x:33:33:www-data:/var/www:/bin/sh
-backup:x:34:34:backup:/var/backups:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
 ftp:x:83:83:ftp:/home/ftp:/bin/sh
 nobody:x:99:99:nobody:/home:/bin/sh
-- 
2.0.4
