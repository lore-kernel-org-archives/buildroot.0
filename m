From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 14:38:01 +0100
Subject: [Buildroot] [git commit] circus: bump to version 0.14.0
Message-ID: <20171208133432.E92EC815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=864e8b20608d2a8e48039744e5b5de91a6d7d68c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/circus/circus.hash | 5 +++--
 package/circus/circus.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/circus/circus.hash b/package/circus/circus.hash
index 728cad5..877ae21 100644
--- a/package/circus/circus.hash
+++ b/package/circus/circus.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/circus/json, sha256 locally computed
-md5	cddd4a8844907d8b6b402ca9c713d176  circus-0.13.0.tar.gz
-sha256	6201800a5fb05144b5e6c5ac9eb901b914305e8beaeb01f8edf54ab6ab1a295a  circus-0.13.0.tar.gz
+md5	48e6b220fb0cafca46e3ae1f6ec4bce8  circus-0.14.0.tar.gz
+sha256	b8ca91d8bd87b350fda199488ac9ddff91a546b0c6214a28a2f13393713cf062  circus-0.14.0.tar.gz
+sha256  3df739c05a4eed7efdf4987142658d2a4f1243e5f08e72a5ecedac5749c92a49  LICENSE
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index 35051c4..8b863aa 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CIRCUS_VERSION = 0.13.0
-CIRCUS_SITE = https://pypi.python.org/packages/source/c/circus
+CIRCUS_VERSION = 0.14.0
+CIRCUS_SITE = https://pypi.python.org/packages/68/41/02c6f5edea2df80b133a12753aee3e698e9130a5c878a9b0bffcf1e17e65
 CIRCUS_SETUP_TYPE = setuptools
 CIRCUS_LICENSE = Apache-2.0
 CIRCUS_LICENSE_FILES = LICENSE
