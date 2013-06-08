From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Jun 2013 21:49:01 +0200
Subject: [Buildroot] [git commit] tcpdump: bump to version 4.4.0
Message-ID: <20130608224113.62CAB9AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=540e67b03996e7b5c90454dfa2d577bf2ece7f36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpdump/tcpdump.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
