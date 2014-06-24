From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:48 -0300
Subject: [Buildroot] [PATCH 42/54] transmission: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-42-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/transmission/transmission.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 37cc58b..f9fb9f8 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -15,10 +15,11 @@ TRANSMISSION_DEPENDENCIES = \
 	openssl \
 	zlib
 TRANSMISSION_AUTORECONF = YES
-
 TRANSMISSION_CONF_OPT = \
 	--disable-libnotify \
 	--enable-lightweight
+TRANSMISSION_LICENSE = GPLv2 or GPLv3
+TRANSMISSION_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
 	TRANSMISSION_CONF_OPT += --enable-utp
-- 
1.8.5.5
