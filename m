From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Dec 2010 22:03:22 +0100
Subject: [Buildroot] [git commit master 1/1] etc/securetty: Add ttyO0 to
	ttyO3 for omap
Message-ID: <20101230210412.75C138F0C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f3931ca1a159530026adc3964fbb173f8113aef6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent kernels (2.6.37*) use a different name for OMAP serial ports.
They are no longer called ttySx but ttyOx.

Signed-off-by: Guillaume GARDET <guillaume.gardet@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/securetty |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index b25f4a5..e69fec7 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -33,3 +33,7 @@ ttyCPM3
 ttymxc0
 ttymxc1
 ttymxc2
+ttyO0
+ttyO1
+ttyO2
+ttyO3
-- 
1.7.2.2
