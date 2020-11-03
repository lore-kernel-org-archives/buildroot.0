From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 21:09:13 +0100
Subject: [Buildroot] [git commit] package/python-remi: bump version to
 2020.10.30
Message-ID: <20201103195617.93A3486FC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d58a2267a61c1377e390aa132850d6098917cf88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-remi/python-remi.hash | 4 ++--
 package/python-remi/python-remi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 2355380163..aecdbc0bb0 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 678c9caf1ecffc03c4a3d59931906520545d77e9a8027ff1a1ca90fc580f56e2  python-remi-2019.9.tar.gz
-sha256 bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
+sha256  afe28d799d147d39954e18377e81101d045affe9c634eed5bf8dfdf888202650  python-remi-2020.10.30.tar.gz
+sha256  bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index df0e1df5a4..53836be9eb 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2019.9
+PYTHON_REMI_VERSION = 2020.10.30
 PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
