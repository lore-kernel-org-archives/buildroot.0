From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:58:58 +0200
Subject: [Buildroot] [git commit] python-sip: bump to version 4.18
Message-ID: <20160626125914.550FB800E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07006d4408eb2ca3dc0fa32ad92987bdff86dc33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-sip/python-sip.hash | 6 +++---
 package/python-sip/python-sip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
index aba5470..2f7d430 100644
--- a/package/python-sip/python-sip.hash
+++ b/package/python-sip/python-sip.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.7/
-md5 32abc003980599d33ffd789734de4c36	sip-4.16.7.tar.gz
+# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.18/
+md5 78724bf2a79878201c3bc81a1d8248ea	sip-4.18.tar.gz
 # Locally calculated:
-sha256 4caa8d52e4403bae5c4c64f44de03a2cfd0bb10b6d96c5fb771133516df9abbd	sip-4.16.7.tar.gz
+sha256 f1dc5c81c07a9ad97edcd4a0af964a41e420024ba7ca165afd2b351efd249cb6	sip-4.18.tar.gz
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 4651186..d13801f 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SIP_VERSION = 4.16.7
+PYTHON_SIP_VERSION = 4.18
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPLv2 or GPLv3
