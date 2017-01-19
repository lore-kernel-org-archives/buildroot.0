From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 13:03:15 +1100
Subject: [Buildroot] [git commit] package/xcb-util: remove obsolete
	dependency on gperf
Message-ID: <20170119020949.308D881E46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b97b5b7a1d355673ce4e3bde16d9632946e9d464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-util/xcb-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 4416d80..7b913e2 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -12,6 +12,6 @@ XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_LICENSE = MIT
 
 XCB_UTIL_INSTALL_STAGING = YES
-XCB_UTIL_DEPENDENCIES = host-gperf libxcb
+XCB_UTIL_DEPENDENCIES = libxcb
 
 $(eval $(autotools-package))
