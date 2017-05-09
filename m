From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:19:06 +0200
Subject: [Buildroot] [git commit branch/next] python-pillow: bump version to
	4.1.1
Message-ID: <20170509152255.A438B8193B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86d7fca66ffcd38e24ee0e8d0b5efec6626f3129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 322e0a9..55b0709 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pillow/json, sha256 locally computed
-md5 d040e1155b4d9d8b011aab67ee0ea86b  Pillow-4.1.0.tar.gz
-sha256 a0fd487fed4a35717401b7566e51a1520b34e7c0f7f2a315a6509f82bc86299f  Pillow-4.1.0.tar.gz
+md5 f2565954955c8d10f3b4f1f72f852bf7  Pillow-4.1.1.tar.gz
+sha256 00b6a5f28d00f720235a937ebc2f50f4292a5c7e2d6ab9a8b26153b625c4f431  Pillow-4.1.1.tar.gz
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index e1167c8..d6914c3 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 4.1.0
+PYTHON_PILLOW_VERSION = 4.1.1
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://pypi.python.org/packages/80/38/5cb561c68155834c596018c47caa44da88ed34b09579b921c0e493fb06c7
+PYTHON_PILLOW_SITE = https://pypi.python.org/packages/93/73/66854f63b1941aad9af18a1de59f9cf95ad1a87c801540222e332f6688d7
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
