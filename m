From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 16:03:37 +0200
Subject: [Buildroot] [git commit] opusfile: bump to version 0.10
Message-ID: <20180607140257.6884B87054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d932638bf3b28ce1c8a88820ae8a7157cef8a56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opusfile/opusfile.hash | 2 +-
 package/opusfile/opusfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index 59e08192f5..f1fcf5f9d6 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 f75fb500e40b122775ac1a71ad80c4477698842a8fe9da4a1b4a1a9f16e4e979  opusfile-0.9.tar.gz
+sha256 48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f  opusfile-0.10.tar.gz
 
 # Hash for license file
 sha256 0267ae795ab744c4e0f9c45e249440fdf2e75dac8c804f36066b28649bf74aaf  COPYING
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 186288ddff..0cfe623941 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUSFILE_VERSION = 0.9
+OPUSFILE_VERSION = 0.10
 OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
