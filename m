From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:55:07 +0200
Subject: [Buildroot] [git commit] package/rtmpdump: bump version
Message-ID: <20190623105426.824FE816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=410c96a28cb185b0de94d0f304fefe81ee638357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added tarball and license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtmpdump/rtmpdump.hash | 3 +++
 package/rtmpdump/rtmpdump.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/rtmpdump/rtmpdump.hash b/package/rtmpdump/rtmpdump.hash
new file mode 100644
index 0000000000..6e85a58419
--- /dev/null
+++ b/package/rtmpdump/rtmpdump.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 b98fceba5155c5a1ee3f26550ea94144c72d8b8c5a050c213bb55dab330ad6ff  rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3.tar.gz
+sha256 03fe7ca91cc28e99b4003d5b3bd4ce3b084d4c475fdf9975cf0e7fdf4dc739cd  librtmp/COPYING
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 03cdd9d00f..bc68b7a836 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTMPDUMP_VERSION = fa8646daeb19dfd12c181f7d19de708d623704c0
+RTMPDUMP_VERSION = c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
 RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPL-2.0 but librtmp has its own license and since we only
