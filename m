From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 7 Apr 2017 17:27:42 +0100
Subject: [Buildroot] [PATCH 2/2] python-pillow: bump version to 4.1.0
In-Reply-To: <20170407162742.52416-1-Vincent.Riera@imgtec.com>
References: <20170407162742.52416-1-Vincent.Riera@imgtec.com>
Message-ID: <20170407162742.52416-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 182e82f..322e0a9 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pillow/json, sha256 locally computed
-md5	d5af224b0fa2c66dacc9814785fef9e7  Pillow-4.0.0.tar.gz
-sha256	ee26d2d7e7e300f76ba7b796014c04011394d0c4a5ed9a288264a3e443abca50  Pillow-4.0.0.tar.gz
+md5 d040e1155b4d9d8b011aab67ee0ea86b  Pillow-4.1.0.tar.gz
+sha256 a0fd487fed4a35717401b7566e51a1520b34e7c0f7f2a315a6509f82bc86299f  Pillow-4.1.0.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index faa0e16..e1167c8 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 4.0.0
+PYTHON_PILLOW_VERSION = 4.1.0
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/8d/80/eca7a2d1a3c2dafb960f32f844d570de988e609f5fd17de92e1cf6a01b0a
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/80/38/5cb561c68155834c596018c47caa44da88ed34b09579b921c0e493fb06c7
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.10.2
