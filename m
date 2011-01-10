From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 00:03:58 +0100
Subject: [Buildroot] [git commit master 1/1] etc/securetty: Add ttyAM for
	ep93xx
Message-ID: <20110110230414.7F3F98A3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aaa291d40b1e746c81092ecac7a6388486325bd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow root login on the Cirrus ep93xx ARM AMBA serial ports.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/securetty |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index e69fec7..fd0ec8e 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -37,3 +37,6 @@ ttyO0
 ttyO1
 ttyO2
 ttyO3
+ttyAM0
+ttyAM1
+ttyAM2
-- 
1.7.2.2
