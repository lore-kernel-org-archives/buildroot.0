From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:41:19 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] python-webpy: use
 webpy-0.39 tag
Message-ID: <20180411154836.2609488454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dff55ea20e8771ebab5769098856261e2612db8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

No functional change, but upstream has now tagged the release, so use the
tag instead of the sha1.

https://github.com/webpy/webpy/issues/449

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 01320bb9ff297bac38a4c9bc32ae505ac79d600f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-webpy/python-webpy.hash | 2 +-
 package/python-webpy/python-webpy.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 30a14f4705..70981e0cb4 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e17ac483846fb15629c76c43cf64c0b65eac3c870dca2251801b459b1e4e12b8  python-webpy-6df75fe581e0e838d28334d5c53f52421560d38b.tar.gz
+sha256  f074241a0b839408a0b9840ade1198e16fbd6aa6393a48a0e84f73b545baab9a  python-webpy-webpy-0.39.tar.gz
 sha256  3826fd531a9b904841f5e3560fcda7e93f2ab8d11ef124ec65e10625efa26c34  LICENSE.txt
 sha256  7347fd17bfd33c4093c31dc77076733e1e0150ce8c13296c56dc042bbecede84  web/wsgiserver/LICENSE.txt
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 1e67cd6fd8..192ba5727f 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-# corresponds to 0.39
-PYTHON_WEBPY_VERSION = 6df75fe581e0e838d28334d5c53f52421560d38b
+PYTHON_WEBPY_VERSION = webpy-0.39
 PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
