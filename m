From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:21:16 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/tor: bump version
	to 0.2.9.10
Message-ID: <20170313233002.ACBBE7FB3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c365c42ef371d948570a2b41b4f87af193a0eab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 660651491ea2ff8fc82d503a8e28bbd54e8d9131)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 470fc48..d14db04 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 33325d2b250fd047ba2ddc5d11c2190c4e2951f4b03ec48ebd8bf0666e990d43  tor-0.2.9.9.tar.gz
+sha256 d611283e1fb284b5f884f8c07e7d3151016851848304f56cfdf3be2a88bd1341  tor-0.2.9.10.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index bb0fbb1..9ccde79 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.9.9
+TOR_VERSION = 0.2.9.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
