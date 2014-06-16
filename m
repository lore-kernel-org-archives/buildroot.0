From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 10:50:35 -0300
Subject: [Buildroot] [PATCH 5/6] ngircd: switch site now that berlios is gone
In-Reply-To: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402926636-3556-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ngircd/ngircd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 13313a7..2eb89af 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -6,7 +6,7 @@
 
 NGIRCD_VERSION = 20.3
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
-NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
+NGIRCD_SITE = http://arthur.barton.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPLv2+
 NGIRCD_LICENSE_FILES = COPYING
-- 
1.8.5.5
