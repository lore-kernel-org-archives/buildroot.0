From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2019 23:23:44 +0200
Subject: [Buildroot] [git commit] package/python-remi: bump version to 2019.9
Message-ID: <20191024212209.7E63B846EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1bf6b244f193d355d75db7dcc0c0598ca3285f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Release after 1.2.2 uses date instead of version, so suppress v character
appended before version

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-remi/python-remi.hash | 2 +-
 package/python-remi/python-remi.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 248772f866..2355380163 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bb82f3f329aef387b3823e7e9b9d06b85a7deb0a4dc9078a4323812e26abb459  python-remi-1.1.tar.gz
+sha256 678c9caf1ecffc03c4a3d59931906520545d77e9a8027ff1a1ca90fc580f56e2  python-remi-2019.9.tar.gz
 sha256 bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 1e1910c811..df0e1df5a4 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 1.1
-PYTHON_REMI_SITE = $(call github,dddomodossola,remi,v$(PYTHON_REMI_VERSION))
+PYTHON_REMI_VERSION = 2019.9
+PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
