From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:48:21 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: adopt package/sysklogd
Message-ID: <20210308222722.B281B87643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9efacd4697c80b621bc205f98e7580f340d16234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since I'm the upstream maintainer and we use it for $DAYJOB, I'll adopt.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f7f8587d1b..f6d6e4aa06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1286,6 +1286,7 @@ F:	board/globalscale/espressobin/
 F:	package/mg/
 F:	package/netcalc/
 F:	package/ssdp-responder/
+F:	package/sysklogd/
 
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
