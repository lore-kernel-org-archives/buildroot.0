From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:02:53 +0200
Subject: [Buildroot] [git commit] package/tor: bump version to 0.3.0.8
Message-ID: <20170610210328.2EDA5800EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2af5c1ff75932eb78a4ecd9b98148ae69867d12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index bfdf055..71868fd 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9640c4448ef3cad7237c68ed6984e705db8fb2b9d6bb74c8815d01bb06527d02  tor-0.3.0.7.tar.gz
+sha256 663a3ba7b8a124c0f8a7351eaa2dda6fd518de3f3c4ee28fff869bfb03860d48  tor-0.3.0.8.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 305f6bf..dc2823d 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.7
+TOR_VERSION = 0.3.0.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
