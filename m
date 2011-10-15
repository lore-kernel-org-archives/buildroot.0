From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:27:46 +0200
Subject: [Buildroot] [git commit] package/Config.in: sort network
	applications alpabetically
Message-ID: <20111015213703.7D79C8E315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d19fbd26836af63b977c4b48e0487f66d53b06d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5a378da..5d4fde2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -458,11 +458,11 @@ source "package/openssh/Config.in"
 source "package/openvpn/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
-source "package/radvd/Config.in"
-source "package/rp-pppoe/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
 source "package/quagga/Config.in"
+source "package/radvd/Config.in"
+source "package/rp-pppoe/Config.in"
 source "package/rsh-redone/Config.in"
 source "package/rsync/Config.in"
 source "package/samba/Config.in"
