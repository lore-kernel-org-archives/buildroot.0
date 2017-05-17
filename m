From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:57:49 +0200
Subject: [Buildroot] [git commit branch/next] package/tor: bump version to
	0.3.0.6
Message-ID: <20170517195804.084858265C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af8b1b0fc27799157b243c70f31940b3a078e1d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index d14db04..5b83aa4 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d611283e1fb284b5f884f8c07e7d3151016851848304f56cfdf3be2a88bd1341  tor-0.2.9.10.tar.gz
+sha256 a3e512e93cb555601fd207d914d7c5fe981d66d6ebb5821ecdf5dea738c2fb14  tor-0.3.0.6.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 389af66..e6cb2b7 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.9.10
+TOR_VERSION = 0.3.0.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
