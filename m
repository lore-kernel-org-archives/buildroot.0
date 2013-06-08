From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  8 Jun 2013 10:53:00 -0300
Subject: [Buildroot] [PATCH 2/2] tcpdump: bump to version 4.4.0
In-Reply-To: <1370699580-14502-1-git-send-email-gustavo@zacarias.com.ar>
References: <1370699580-14502-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1370699580-14502-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tcpdump/tcpdump.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 6b95ba7..a865e81 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.3.0
+TCPDUMP_VERSION = 4.4.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-
 TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
 TCPDUMP_CONF_OPT = --without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
-- 
1.8.1.5
