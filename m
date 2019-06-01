From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:10:30 +0200
Subject: [Buildroot] [git commit] package/network-manager: drop unrecognized
 --without-docs
Message-ID: <20190601131045.D1BA87FD9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a28c727bb77ce83a0c5c6b0d87d4e46374200371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-docs was not recognized since at least version 1.8.4, see:
http://autobuild.buildroot.org/results/e1464adf0069952ef0561a0a9b501d26bd409c4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 4ed89231fb..f9893680fa 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -26,7 +26,6 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--disable-tests \
 	--disable-qt \
 	--disable-more-warnings \
-	--without-docs \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
 	--disable-ifupdown
