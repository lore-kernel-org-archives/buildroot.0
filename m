From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 19:23:00 +0100
Subject: [Buildroot] [git commit] system/skeleton: remove haldaemon
Message-ID: <20141027182313.60BC7B169A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=496f39ba7a2834e7a1b406a2803645521ea77b93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We dropped the hal package quite some time ago, and it's not even a
properly created user.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/group  |    1 -
 system/skeleton/etc/passwd |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 41c396b..98f712b 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -20,7 +20,6 @@ utmp:x:43:
 plugdev:x:46:
 staff:x:50:
 lock:x:54:
-haldaemon:x:68:
 dbus:x:81:
 netdev:x:82:
 ftp:x:83
diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index 8696954..d2e426b 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -8,7 +8,6 @@ proxy:x:13:13:proxy:/bin:/bin/sh
 www-data:x:33:33:www-data:/var/www:/bin/sh
 backup:x:34:34:backup:/var/backups:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
-haldaemon:x:68:68:hald:/:/bin/sh
 dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
 ftp:x:83:83:ftp:/home/ftp:/bin/sh
 nobody:x:99:99:nobody:/home:/bin/sh
