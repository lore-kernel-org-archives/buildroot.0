From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:58:18 +0100
Subject: [Buildroot] [git commit] python-treq: bump to version 16.12.0
Message-ID: <20170302205924.C951382298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7335389f109667dad0162805bf6b894f48ee191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-treq/python-treq.hash | 6 +++---
 package/python-treq/python-treq.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index f4cc4d6..a961b80 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b1fb60759ad5a885cb8ea562553f2d4c, sha256 locally computed
-md5	b1fb60759ad5a885cb8ea562553f2d4c  treq-15.1.0.tar.gz
-sha256	425a47d5d52a993d51211028fb6ade252e5fbea094e878bb4b644096a7322de8  treq-15.1.0.tar.gz
+# md5 from https://pypi.python.org/pypi/treq/json, sha256 locally computed
+md5 421dea5bc8294c14aa24d64628a2eaea treq-16.12.0.tar.gz
+sha256 b008edc81157969ad2bf23bece083adedb0adf249368a3896bb5ac9a871b91a9 treq-16.12.0.tar.gz
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index dbf0e14..aa8c191 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 15.1.0
+PYTHON_TREQ_VERSION = 16.12.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = http://pypi.python.org/packages/source/t/treq
+PYTHON_TREQ_SITE = https://pypi.python.org/packages/26/4b/303880fb5bab1111654df2df0f201f4ba038221bdc52f5a395f0abfc0cb1
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
