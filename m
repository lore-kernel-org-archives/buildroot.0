From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:49:15 +0100
Subject: [Buildroot] [git commit] python-setuptools: bump to version v38.4.0
Message-ID: <20180116225030.29F9B83D9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c09a5c15ab67e844611e6757c141a2e9868d4166
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-setuptools/python-setuptools.hash | 3 ++-
 package/python-setuptools/python-setuptools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index de6ad56..f116a69 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  99339ac1b4c9bc0a74745d6ff196a207ddfb5f7ca75df76f3d8d081a7f70cecc  python-setuptools-v36.0.1.tar.gz
+sha256  2599b4c452e77824bbd6da28d16b1fe8159c7a4c203d8d419d8b348fde7b9549  python-setuptools-v38.4.0.tar.gz
+sha256  c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 28d4f29..004fc0d 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = v36.0.1
+PYTHON_SETUPTOOLS_VERSION = v38.4.0
 PYTHON_SETUPTOOLS_SITE = $(call github,pypa,setuptools,$(PYTHON_SETUPTOOLS_VERSION))
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
