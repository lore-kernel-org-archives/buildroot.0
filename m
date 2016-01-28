From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:29:08 +0100
Subject: [Buildroot] [git commit] package/libcurl: security bump version to
	7.47.0
Message-ID: <20160201224713.5B5A47F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4adae5d2eaa2eda770c1b5873265dfbca908d21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
CVE-2016-0754: remote file name path traversal in curl tool for Windows
CVE-2016-0755: NTLM credentials not-checked for proxy connection re-use

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index eb5bab1..cd35d4c 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256 b7d726cdd8ed4b6db0fa1b474a3c59ebbbe4dcd4c61ac5e7ade0e0270d3195ad  curl-7.46.0.tar.bz2
+# Locally calculated
+sha256	2b096f9387fb9b2be08d17e518c62b6537b1f4d4bb59111d5b4fa0272f383f66	curl-7.47.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e64014d..db9ef3f 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.46.0
+LIBCURL_VERSION = 7.47.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
