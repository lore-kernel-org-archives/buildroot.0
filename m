From: Ilias Apalodimas <apalos@gmail.com>
Date: Thu,  9 Feb 2017 22:59:20 +0200
Subject: [Buildroot] [PATCH v4 2/2] keepalived: new package
In-Reply-To: <1486673960-2600-1-git-send-email-apalos@gmail.com>
References: <1486673960-2600-1-git-send-email-apalos@gmail.com>
Message-ID: <1486673960-2600-2-git-send-email-apalos@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
---
 package/ipset/ipset.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index db4952b..bb40fee 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -13,5 +13,6 @@ IPSET_CONF_OPTS = --with-kmod=no
 IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
+IPSET_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.9.1
