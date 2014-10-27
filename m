From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 15:18:57 -0300
Subject: [Buildroot] [PATCH 4/8] system/skeleton: drop proxy user
In-Reply-To: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414433941-5778-4-git-send-email-gustavo@zacarias.com.ar>
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
index 2e7e77a..dc78581 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -4,7 +4,6 @@ bin:x:2:2:bin:/bin:/bin/sh
 sys:x:3:3:sys:/dev:/bin/sh
 sync:x:4:100:sync:/bin:/bin/sync
 mail:x:8:8:mail:/var/spool/mail:/bin/sh
-proxy:x:13:13:proxy:/bin:/bin/sh
 www-data:x:33:33:www-data:/var/www:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
 ftp:x:83:83:ftp:/home/ftp:/bin/sh
-- 
2.0.4
