From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 22:37:43 +0100
Subject: [Buildroot] [git commit] system/permissions: /etc/random-seed must
	be mode 600
Message-ID: <20141125213915.8E59D7FD9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87fd1bd5ce27f1ea1e6809c0c522afe618417097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it's a big security risk.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/device_table.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/device_table.txt b/system/device_table.txt
index e15412d..8e7dbd2 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -11,6 +11,7 @@
 /etc					d	755	0	0	-	-	-	-	-
 /root					d	700	0	0	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
+/etc/random-seed			f	600	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
