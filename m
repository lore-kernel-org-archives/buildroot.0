From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:01:50 +0100
Subject: [Buildroot] [git commit] c-ares: bump to version 1.11.0
Message-ID: <20160322090345.DFB417FAC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=985299b978516c67fced8133da7aaa7543dd63be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 40f703b..f24cc36 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db c-ares-1.10.0.tar.gz
+sha256 b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd c-ares-1.11.0.tar.gz
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 77ae4b9..298fe41 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.10.0
+C_ARES_VERSION = 1.11.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
