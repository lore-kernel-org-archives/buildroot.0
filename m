From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:12 -0300
Subject: [Buildroot] [PATCH 06/54] liesmtp: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libesmtp/libesmtp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index f3f5611..cad2e27 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -10,5 +10,7 @@ LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
+LIBESMTP_LICENSE = GPLv2+ (examples), LGPLv2.1+ (library)
+LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
-- 
1.8.5.5
