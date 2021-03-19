From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 23:18:25 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: remove myself
 for aufs
Message-ID: <20210319215633.725A5884BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8828a9d393c50e1ba0ad21d059ebbb433eade1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index 8e4595496e..a47fd621b7 100644
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
