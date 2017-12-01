From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Dec 2017 18:46:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump to version
 0.3.1.9
Message-ID: <20171201174603.14173-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.torproject.org/new-stable-tor-releases-security-fixes-0319-03013-02914-02817-02516

Fixes CVE-2017-8819, CVE-2017-8820, CVE-2017-8821, CVE-2017-8822
and CVE-2017-8823.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index cf8841aecf..08ab61ec14 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7df6298860a59f410ff8829cf7905a50c8b3a9094d51a8553603b401e4b5b1a1  tor-0.3.1.8.tar.gz
+sha256 6e1b04f7890e782fd56014a0de5075e4ab29b52a35d8bca1f6b80c93f58f3d26  tor-0.3.1.9.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a069651b1c..ef0950c89f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.1.8
+TOR_VERSION = 0.3.1.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
