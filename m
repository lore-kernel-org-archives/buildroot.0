From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:33:56 +0200
Subject: [Buildroot] [git commit] python-sh: bump to version 1.12.14
Message-ID: <20170712163002.4305D7FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65dcaf0a8b1ceb22de2fdd0303b01c9afc431ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index ab3c4e0..cbc6745 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/sh/json, sha256 locally computed
-md5 ddc128a8d943d25afa6e01af11e0063b sh-1.12.9.tar.gz
-sha256 579aa19bae7fe86b607df1afaf4e8537c453d2ce3d84e1d3957e099359a51677 sh-1.12.9.tar.gz
+md5 a8351aef25d25f707c17e0a7a6280251 sh-1.12.14.tar.gz
+sha256 b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc sh-1.12.14.tar.gz
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index ed171cb..dfe80d5 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.12.9
+PYTHON_SH_VERSION = 1.12.14
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://pypi.python.org/packages/fd/14/6deb4e89cc237ee4bc1c0b0485c77d7868477f96c47962366bc5fabc31fd
+PYTHON_SH_SITE = https://pypi.python.org/packages/7c/71/199d27d3e7e78bf448bcecae0105a1d5b29173ffd2bbadaa95a74c156770
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
