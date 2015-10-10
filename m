From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:32:14 +0200
Subject: [Buildroot] [git commit] skeleton: Remove ftp user and /home/ftp
Message-ID: <20151010173637.E1A7C81DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dde19e5f32c58ffbf7e190257b073e91e0a7e8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/group       |    1 -
 system/skeleton/etc/passwd      |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

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
