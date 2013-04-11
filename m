From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 23:32:11 +0200
Subject: [Buildroot] [git commit] system/securetty: Add ttyPS[0-1]
Message-ID: <20130411213453.D48C79B560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c4ff68e08e063152245d0a1b211df7a4360f925
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding ttyPS0 and ttyPS1 to securetty for Zynq.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/skeleton/etc/securetty |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/securetty b/system/skeleton/etc/securetty
index c96f2fb..5a3d0c6 100644
--- a/system/skeleton/etc/securetty
+++ b/system/skeleton/etc/securetty
@@ -22,6 +22,8 @@ ttyUL0
 ttyUL1
 ttyUL2
 ttyUL3
+ttyPS0
+ttyPS1
 ttyPSC0
 ttyPSC1
 ttyPSC2
