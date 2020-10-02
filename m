From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:02:35 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/python-texttable:
 bump version to 1.6.3
Message-ID: <20201002082506.B758A8E7E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d09a19dfee326f81c39f2adec6f2af4b00c25ee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Bugfix release, fixing an issue with integer/float handling:
https://github.com/foutaise/texttable/issues/70

Adjust the .hash spacing and update the license hash for a copyright year
change:
https://github.com/foutaise/texttable/commit/13ff0b57d3f727a266ce45f86642f0458257bb8e

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc68be69440f3d5e7a8d5fc2c25597ddbbe1473b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-texttable/python-texttable.hash | 6 +++---
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 367eb8d60f..a69e8ed465 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5	763141f0bdf598cdc5cf780ed4d2eb94  texttable-1.6.2.tar.gz
-sha256	eff3703781fbc7750125f50e10f001195174f13825a92a45e9403037d539b4f4  texttable-1.6.2.tar.gz
+md5  68e6b31d36f5c20221da7d5db3eca772  texttable-1.6.3.tar.gz
+sha256  ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436  texttable-1.6.3.tar.gz
 # Locally computed sha256 checksums
-sha256	181d0c3366cc36fd6ae7d023b23a743581003fd42974c8983ea40f7161faeaf3  LICENSE
+sha256	4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 3b173a35ee..6af23917b9 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.6.2
+PYTHON_TEXTTABLE_VERSION = 1.6.3
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/82/a8/60df592e3a100a1f83928795aca210414d72cebdc6e4e0c95a6d8ac632fe
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/f5/be/716342325d6d6e05608e3a10e15f192f3723e454a25ce14bc9b9d1332772
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
