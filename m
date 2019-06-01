From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Jun 2019 12:53:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/network-manager: drop unrecognized
 --without-docs
In-Reply-To: <20190601105351.21675-1-fontaine.fabrice@gmail.com>
References: <20190601105351.21675-1-fontaine.fabrice@gmail.com>
Message-ID: <20190601105351.21675-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--without-docs was not recognized since at least version 1.8.4, see:
http://autobuild.buildroot.org/results/e1464adf0069952ef0561a0a9b501d26bd409c4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
