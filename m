From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:17:48 +0200
Subject: [Buildroot] [git commit] python-futures: bump to version 3.2.0
Message-ID: <20180930181808.C8C1782706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d1cbb432f571c97082fdff3e7fcec6ca9852bd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-futures/python-futures.hash | 8 +++++---
 package/python-futures/python-futures.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-futures/python-futures.hash b/package/python-futures/python-futures.hash
index f0948ae4e2..db6bb55ea2 100644
--- a/package/python-futures/python-futures.hash
+++ b/package/python-futures/python-futures.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/futures/json, sha256 locally computed
-md5	ced2c365e518242512d7a398b515ff95  futures-3.0.5.tar.gz
-sha256	0542525145d5afc984c88f914a0c85c77527f65946617edb5274f72406f981df  futures-3.0.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/futures/json
+md5	d1b299a06b96ccb59f70324716dc0016  futures-3.2.0.tar.gz
+sha256	9ec02aa7d674acb8618afb127e27fde7fc68994c0437ad759fa094a574adb265  futures-3.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	a698bd5d441e4a16af6c992b8e80cbfa12755d72d910854fa1fb11d4deb0059a  LICENSE
diff --git a/package/python-futures/python-futures.mk b/package/python-futures/python-futures.mk
index fabfa6ae37..d6366f30ed 100644
--- a/package/python-futures/python-futures.mk
+++ b/package/python-futures/python-futures.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FUTURES_VERSION = 3.0.5
+PYTHON_FUTURES_VERSION = 3.2.0
 PYTHON_FUTURES_SOURCE = futures-$(PYTHON_FUTURES_VERSION).tar.gz
-PYTHON_FUTURES_SITE = https://pypi.python.org/packages/55/db/97c1ca37edab586a1ae03d6892b6633d8eaa23b23ac40c7e5bbc55423c78
+PYTHON_FUTURES_SITE = https://files.pythonhosted.org/packages/1f/9e/7b2ff7e965fc654592269f2906ade1c7d705f1bf25b7d469fa153f7d19eb
 PYTHON_FUTURES_SETUP_TYPE = setuptools
 PYTHON_FUTURES_LICENSE = BSD-2-Clause
 PYTHON_FUTURES_LICENSE_FILES = LICENSE
