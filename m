From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:40:12 +0200
Subject: [Buildroot] [git commit master] busybox skeleton: allow logins from
	ttymxc[0-2]
Message-ID: <20100526124038.ABA74380@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21350c5f2f4fd365440b23d9188e36240ea323b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add ttymxc[0-2] to the list is the /etc/securetty of the Busybox skeleton.
This is useful for serial logins on i.MX based systems. The same serial
devices already appear in the generic "target_skeleton/".

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
