From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2015 23:55:50 +0200
Subject: [Buildroot] [git commit] libpcap: bump to version 1.7.3
Message-ID: <20150601220249.76DF281D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c452f2b1fcfe11fa64e29ea9669e742fe2cbe94a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.hash |    2 +-
 package/libpcap/libpcap.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 967f2dd..eea87d9 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1a4abc1f268b68f97e69a497f53695c9acc7a13f1d522a4d940dea276e6698ae	libpcap-1.7.2.tar.gz
+sha256	dd9f85213dc8e948068405b55dd20f8b32e3083e9e0e186f833bd0372e559e2f	libpcap-1.7.3.tar.gz
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 68d6614..eb64641 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.7.2
+LIBPCAP_VERSION = 1.7.3
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
