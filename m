From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Aug 2017 21:28:52 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/opusfile: bump version to 0.9
In-Reply-To: <20170830192853.24222-1-bernd.kuhls@t-online.de>
References: <20170830192853.24222-1-bernd.kuhls@t-online.de>
Message-ID: <20170830192853.24222-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch upstream URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opusfile/opusfile.hash | 2 +-
 package/opusfile/opusfile.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index 541a21fe5..528ded207 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	2c231ed3cfaa1b3173f52d740e5bbd77d51b9dfecb87014b404917fba4b855a4	opusfile-0.8.tar.gz
+sha256 f75fb500e40b122775ac1a71ad80c4477698842a8fe9da4a1b4a1a9f16e4e979  opusfile-0.9.tar.gz
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 846eedd22..186288ddf 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPUSFILE_VERSION = 0.8
-OPUSFILE_SITE = http://downloads.xiph.org/releases/opus
+OPUSFILE_VERSION = 0.9
+OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
-- 
2.11.0
