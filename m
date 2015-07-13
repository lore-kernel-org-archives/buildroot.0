From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:05:31 +0200
Subject: [Buildroot] [git commit] libpcap: bump to version 1.7.4
Message-ID: <20150713150538.61C6B81946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce37d35862d5fd5f93624c698a76fe1e3607bf36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.hash |    2 +-
 package/libpcap/libpcap.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index eea87d9..5ce5367 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	dd9f85213dc8e948068405b55dd20f8b32e3083e9e0e186f833bd0372e559e2f	libpcap-1.7.3.tar.gz
+sha256	7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0	libpcap-1.7.4.tar.gz
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index eb64641..eb21fa9 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.7.3
+LIBPCAP_VERSION = 1.7.4
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
