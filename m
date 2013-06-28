From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:00 -0300
Subject: [Buildroot] [PATCH 03/19] ctorrent: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ctorrent/ctorrent.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index aebf123..65e327e 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -7,6 +7,8 @@
 CTORRENT_VERSION = dnh3.3.2
 CTORRENT_SOURCE = ctorrent-$(CTORRENT_VERSION).tar.gz
 CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent/
+CTORRENT_LICENSE = GPLv2
+CTORRENT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CTORRENT_CONF_OPT+=--with-ssl=yes
-- 
1.8.1.5
