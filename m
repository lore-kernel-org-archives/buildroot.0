From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 15:31:35 +0200
Subject: [Buildroot] [PATCH 3/3] skeleton: Remove ftp user and /home/ftp
In-Reply-To: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443965495-12774-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 system/skeleton/etc/group       | 1 -
 system/skeleton/etc/passwd      | 1 -
 system/skeleton/home/ftp/.empty | 0
 3 files changed, 2 deletions(-)
 delete mode 100644 system/skeleton/home/ftp/.empty

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index c1dc11f..ba20e90 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -21,6 +21,5 @@ plugdev:x:46:
 staff:x:50:
 lock:x:54:
 netdev:x:82:
-ftp:x:83:
 nogroup:x:99:
 users:x:100:
diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index 3a80341..883265a 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -6,5 +6,4 @@ sync:x:4:100:sync:/bin:/bin/sync
 mail:x:8:8:mail:/var/spool/mail:/bin/false
 www-data:x:33:33:www-data:/var/www:/bin/false
 operator:x:37:37:Operator:/var:/bin/false
-ftp:x:83:83:ftp:/home/ftp:/bin/false
 nobody:x:99:99:nobody:/home:/bin/false
diff --git a/system/skeleton/home/ftp/.empty b/system/skeleton/home/ftp/.empty
deleted file mode 100644
index e69de29..0000000
-- 
2.5.3
