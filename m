From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jun 2017 23:00:33 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] tor: security bump to
	version 0.2.9.11
Message-ID: <20170611210235.DB1AB7FE1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bf22d3e80bba37efbec5d2a0b020c0a9062e83c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fixes CVE-2017-0376: Fix a remotely triggerable assertion failure caused by
receiving a BEGIN_DIR cell on a hidden service rendezvous circuit.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index d14db04..d42c534 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d611283e1fb284b5f884f8c07e7d3151016851848304f56cfdf3be2a88bd1341  tor-0.2.9.10.tar.gz
+sha256 c1959bebff9a546a54cbedb58c8289a42441991af417d2d16f7b336be8903221  tor-0.2.9.11.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 389af66..17208c0 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.9.10
+TOR_VERSION = 0.2.9.11
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
