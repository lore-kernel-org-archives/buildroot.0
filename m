From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 15:59:22 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: change developer for
	wpa_supplicant
Message-ID: <20161015135935.846F47FE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c09e484f6d5bb0512747e43d0449ed9f1bd0c25b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wpa_supplicant was in fact no introduced by Peter, but by Gustavo,
and Gustavo is much more active in maintaining this package, so let's
mention Gustavo as the developer for this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c535942..84a0844 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -718,6 +718,7 @@ F:	package/webkitgtk/
 F:	package/webkitgtk24/
 F:	package/whois/
 F:	package/wireshark/
+F:	package/wpa_supplicant/
 F:	package/wpan-tools/
 F:	package/x11r7/xdriver_xf86-video-qxl/
 F:	package/xtables-addons/
@@ -1147,7 +1148,6 @@ F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
 F:	package/triggerhappy/
-F:	package/wpa_supplicant/
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	board/raspberrypi/
