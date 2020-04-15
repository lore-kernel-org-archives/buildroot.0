From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:35:54 +0200
Subject: [Buildroot] [git commit] package/python-h2: bump to version 3.2.0
Message-ID: <20200415192340.835DB8EB5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8276ff5123dd56fd9ceb5077c0c2296177d9cf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-h2/python-h2.hash | 6 +++---
 package/python-h2/python-h2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 1d5df8878d..4193567d37 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5	950b5a62a2a608dc4547a01edf99aa8f  h2-3.1.1.tar.gz
-sha256	b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4  h2-3.1.1.tar.gz
+md5  197a99c09f344a0dd987fab9801dc8d0  h2-3.2.0.tar.gz
+sha256  875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14  h2-3.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  LICENSE
+sha256  663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index 0043ee2d50..81397bbb10 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 3.1.1
+PYTHON_H2_VERSION = 3.2.0
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/56/73/0bc3a2f4238bdfbd9b0dc41a972fb558d96e8580ef2a37129ee5a54fa04e
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/08/0a/033df0fc05fe94f72517ccd393dd9ff99b1773fd198307638e6d3568a518
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
