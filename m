From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jul 2018 10:25:54 +0200
Subject: [Buildroot] [git commit] package/tor: bump version to 0.3.3.8
Message-ID: <20180710082207.6B1BA881E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96b4568f596fb9337d2e099f6e33d5aecc2db4ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://blog.torproject.org/tor-0338-released

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 554d5906b6..d56855f45e 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ea6bb512c4adfbc4e05b22e4c2d06bddff5b358a53de982273fec846b75bde0c  tor-0.3.3.7.tar.gz
+sha256 3cf5b4fea2491cbfefa1077bf1b2855e169052d381bd920cd57aa9bfaff6b3a5  tor-0.3.3.8.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index fe22633bf6..6f977f8625 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.3.7
+TOR_VERSION = 0.3.3.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
