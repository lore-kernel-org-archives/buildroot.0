From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:24 -0000
Subject: [Buildroot] [git commit branch/next] system/device_table.txt:
	/etc/random-seed is no more
Message-ID: <20150808105623.E916B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b47c7f095fbb545ce38654ed276bfdcf73e5913
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

So don't try to set the permissions of it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/device_table.txt |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/system/device_table.txt b/system/device_table.txt
index f018e63..dc1af51 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -11,7 +11,6 @@
 /etc					d	755	0	0	-	-	-	-	-
 /root					d	700	0	0	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
-/etc/random-seed			f	600	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
