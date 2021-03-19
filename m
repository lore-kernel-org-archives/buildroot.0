From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 20:40:33 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: adopt
 package/sysklogd
Message-ID: <20210319200403.A7B397F8DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bccf9596b05ce4c25195908ac892365634fbc9c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Since I'm the upstream maintainer and we use it for $DAYJOB, I'll adopt.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9efacd4697c80b621bc205f98e7580f340d16234)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c48236da4..8e4595496e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1283,6 +1283,7 @@ F:	board/globalscale/espressobin/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
+F:	package/sysklogd/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
