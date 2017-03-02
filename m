From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:54:15 +0100
Subject: [Buildroot] [git commit] python-pytrie: bump to version 0.3
Message-ID: <20170302205924.7EA467FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0c7bd34286b39192dc8958dcf2140b240032b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pytrie/python-pytrie.hash | 6 +++---
 package/python-pytrie/python-pytrie.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytrie/python-pytrie.hash b/package/python-pytrie/python-pytrie.hash
index 88d2542..a8db914 100644
--- a/package/python-pytrie/python-pytrie.hash
+++ b/package/python-pytrie/python-pytrie.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5997b46c854a68bc588f4527c987663a, sha256 locally computed.
-md5	5997b46c854a68bc588f4527c987663a  PyTrie-0.2.tar.gz
-sha256	b272021351efadc6757591aac03ed4794bdfd091122204a4673e94bfb66cc500  PyTrie-0.2.tar.gz
+# md5 from https://pypi.python.org/pypi/pytrie/json, sha256 locally computed
+md5 32d824476a5beab2bc79620fb5871cd2 PyTrie-0.3.tar.gz
+sha256 0c1bd0cb7c301b193da4bcf31bdf68bbdbea88be4bea5f680caecc56d9b74020 PyTrie-0.3.tar.gz
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
index e3bea4f..0869710 100644
--- a/package/python-pytrie/python-pytrie.mk
+++ b/package/python-pytrie/python-pytrie.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PYTRIE_VERSION = 0.2
-PYTHON_PYTRIE_SITE = http://pypi.python.org/packages/source/P/PyTrie
+PYTHON_PYTRIE_VERSION = 0.3
+PYTHON_PYTRIE_SITE = https://pypi.python.org/packages/aa/4a/3a3e7e95cb6202192c268043bed586f299e5b72b2650ece4614f60aecf2b
 PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
 PYTHON_PYTRIE_LICENSE = BSD-3c
 PYTHON_PYTRIE_LICENSE_FILES = LICENSE
