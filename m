From: Christian Stewart <christian@paral.in>
Date: Fri, 12 Mar 2021 14:08:14 -0800
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove myself for aufs
Message-ID: <20210312220814.1318426-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aufs has been deprecated for the purposes of Docker/containers since overlay2
became the mainline kernel module of choice.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f6d6e4aa06..ad6bd1f241 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -509,9 +509,6 @@ N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
-F:	linux/linux-ext-aufs.mk
-F:	package/aufs/
-F:	package/aufs-util/
 F:	package/batman-adv/
 F:	package/delve/
 F:	package/docker-cli/
-- 
2.30.2
