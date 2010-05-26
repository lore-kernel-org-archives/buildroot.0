From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 May 2010 07:31:36 +0300
Subject: [Buildroot] [PATCH] skeleton: allow logins from ttymxc[0-2]
Message-ID: <8abc531ffb433d44641cb8df53abbbe7977b77bd.1274848117.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ttymxc[0-2] to the list is the /etc/securetty of the Busybox skeleton.
This is useful for serial logins on i.MX based systems. The same serial
devices already appear in the generic "target_skeleton/".

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../generic/target_busybox_skeleton/etc/securetty  |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/target/generic/target_busybox_skeleton/etc/securetty b/target/generic/target_busybox_skeleton/etc/securetty
index 0e7cf97..b25f4a5 100644
--- a/target/generic/target_busybox_skeleton/etc/securetty
+++ b/target/generic/target_busybox_skeleton/etc/securetty
@@ -30,3 +30,6 @@ ttyCPM0
 ttyCPM1
 ttyCPM2
 ttyCPM3
+ttymxc0
+ttymxc1
+ttymxc2
-- 
1.7.1
