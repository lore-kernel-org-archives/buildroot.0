From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:21 +0200
Subject: [Buildroot] [PATCH/next 6/9] package/c-icap: remove configure
	option process-mutexes
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option was removed in 2014:
https://sourceforge.net/p/c-icap/code/1102/#diff-3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index fee9695c1..dd1129e67 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -12,7 +12,6 @@ C_ICAP_LICENSE_FILES = COPYING
 C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
-	--with-process-mutexes=posix \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
-- 
2.11.0
