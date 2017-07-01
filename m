From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:41:39 +0200
Subject: [Buildroot] [git commit] libsigrokdecode: bump version to 0.5.0
Message-ID: <20170701223913.B8CCC7FFDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6b90e2b561d5898245174d23313033f128db27f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrokdecode/libsigrokdecode.hash | 2 +-
 package/libsigrokdecode/libsigrokdecode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsigrokdecode/libsigrokdecode.hash b/package/libsigrokdecode/libsigrokdecode.hash
index ccb2016..a4914b2 100644
--- a/package/libsigrokdecode/libsigrokdecode.hash
+++ b/package/libsigrokdecode/libsigrokdecode.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	065f70c10971173d86e03a8cf5534e600c7a622775113997d8061572135d4a95	libsigrokdecode-0.4.1.tar.gz
+sha256	4aa8579ecea9b421b8ac048a9b18c27e63206839f269374398d89c14a47bd1c1	libsigrokdecode-0.5.0.tar.gz
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index ac53e7e..95e6e69 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROKDECODE_VERSION = 0.4.1
+LIBSIGROKDECODE_VERSION = 0.5.0
 LIBSIGROKDECODE_SITE = http://sigrok.org/download/source/libsigrokdecode
 LIBSIGROKDECODE_LICENSE = GPL-3.0+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
