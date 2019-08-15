From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Aug 2019 16:01:45 +0200
Subject: [Buildroot] [PATCH 3/4] package/batctl: fix license
In-Reply-To: <20190815140146.28224-1-fontaine.fabrice@gmail.com>
References: <20190815140146.28224-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815140146.28224-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

batman_adv.h and list.h are licensed under MIT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/batctl/batctl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 122263e460..824d2e15f5 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -6,7 +6,7 @@
 
 BATCTL_VERSION = 2017.0
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
-BATCTL_LICENSE = GPL-2.0
+BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
 BATCTL_DEPENDENCIES = libnl host-pkgconf
 
 define BATCTL_BUILD_CMDS
-- 
2.20.1
