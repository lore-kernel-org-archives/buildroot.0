From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pygments: bump to version 2.2.0
Message-ID: <20170302205924.2E29F7FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beeaada9ac6a74dd83d057371c45586c4adcad0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 2af1597..525aa0e 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pygments/json, sha256 locally computed
-md5	ed3fba2467c8afcda4d317e4ef2c6150  Pygments-2.1.3.tar.gz
-sha256	88e4c8a91b2af5962bfa5ea2447ec6dd357018e86e94c7d14bd8cacbc5b55d81  Pygments-2.1.3.tar.gz
+md5 13037baca42f16917cbd5ad2fab50844 Pygments-2.2.0.tar.gz
+sha256 dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc Pygments-2.2.0.tar.gz
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 16ed90d..9a7b848 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.1.3
+PYTHON_PYGMENTS_VERSION = 2.2.0
 PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504
+PYTHON_PYGMENTS_SITE = https://pypi.python.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a
 PYTHON_PYGMENTS_LICENSE = BSD-2c
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
