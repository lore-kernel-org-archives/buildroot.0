From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 23:20:29 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: remove myself for aufs
Message-ID: <20210312215736.6CDCE873FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a99b47ec2606141560ddba769ad8d1d35baf252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Aufs has been deprecated for the purposes of Docker/containers since overlay2
became the mainline kernel module of choice.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
