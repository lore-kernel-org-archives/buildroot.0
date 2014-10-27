From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 19:23:00 +0100
Subject: [Buildroot] [git commit] system/skeleton: drop backup user
Message-ID: <20141027182313.778F3B169B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4cb9097f2a68900956d1d1944b80e55ec196c8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AFAIK no package uses it and even if it did it would belong there.
And it's not a standard user either.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/passwd |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
