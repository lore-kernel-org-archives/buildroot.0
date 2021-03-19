From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 23:19:22 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] DEVELOPERS: remove myself
 for aufs
Message-ID: <20210319215617.529DA8840D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f112febdd9c15794cc1dd4d049eae1f69e37d2b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Aufs has been deprecated for the purposes of Docker/containers since overlay2
became the mainline kernel module of choice.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8a99b47ec2606141560ddba769ad8d1d35baf252)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b9ea6bf267..bb32794ff7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -517,9 +517,6 @@ N:	Christian Kellermann <christian.kellermann@solectrix.de>
 F:	package/python-pylibftdi/
 
 N:	Christian Stewart <christian@paral.in>
-F:	linux/linux-ext-aufs.mk
-F:	package/aufs/
-F:	package/aufs-util/
 F:	package/batman-adv/
 F:	package/docker-cli/
 F:	package/docker-containerd/
