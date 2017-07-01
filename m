From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:11:31 +0200
Subject: [Buildroot] [git commit] package/tor: security bump to version
	0.3.0.9
Message-ID: <20170701080845.B97D1802A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=712378a416d65f12ca7efed9a75c2e58c6e62189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://blog.torproject.org/blog/tor-0309-released-security-update-clients

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 71868fd..618acdc 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 663a3ba7b8a124c0f8a7351eaa2dda6fd518de3f3c4ee28fff869bfb03860d48  tor-0.3.0.8.tar.gz
+sha256 48d4880bf6ccb19ce9af2abde6946d7cf0635cc807548badbf4a221a79581e42  tor-0.3.0.9.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index dc2823d..0fa17e6 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.8
+TOR_VERSION = 0.3.0.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
