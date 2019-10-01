From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 07:20:05 +0200
Subject: [Buildroot] [git commit] package/hiawatha: bump to version 10.10
Message-ID: <20191001051737.BC3D8841A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc3f02c06cdf314dfbdee9096f751f8ba6d9b6c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since 10.9:

- Removed several build options. Functionalities are now always enabled.
- mbed TLS updated to 2.16.3.
- Updated Let's Encrypt script due to changes in the API.
- Bugfix: AlterMode not working correctly.

Diffing the CMakeLists.txt between 10.9 and 10.10 does not show any
build option change that is relevant for us.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 8c3dcd39b2..359a435420 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 74dd43812272c3ddbf067b6d4da1773cdeef2ffe71e8f164449fabf8431752b8  hiawatha-10.9.tar.gz
+sha256 b5e46f5757fa647e77d21d24f7eea912d59f26a75558cba780b45c1c3a33a4d9  hiawatha-10.10.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index e740ed9c73..eefd0f6f89 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.9
+HIAWATHA_VERSION = 10.10
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
