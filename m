From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Sep 2017 23:10:24 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] tor: security bump to
	version 0.2.9.12
Message-ID: <20170923210344.15C458103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4adb61ec73a74767851eccb6b7c8d6242fe58fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-0380: Stack disclosure in hidden services logs when
SafeLogging disabled

For more details, see:
https://trac.torproject.org/projects/tor/ticket/23490

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index d42c534..ba0b47a 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c1959bebff9a546a54cbedb58c8289a42441991af417d2d16f7b336be8903221  tor-0.2.9.11.tar.gz
+sha256 6e7466625d53812f23c2ad60a873c5855f63f756fde0fc5cbeda8d32cee1086b  tor-0.2.9.12.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 7bbd2f3..4cc5c48 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.9.11
+TOR_VERSION = 0.2.9.12
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
