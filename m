From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 11:41:15 +0200
Subject: [Buildroot] [git commit] python-dpkt: add license information
Message-ID: <20140626115219.0C8179CF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddfd12c8ec2d26b57844a0f869f35aa6ab8bbfac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dpkt/python-dpkt.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 0b3dc11..fb630fb 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -5,8 +5,10 @@
 ################################################################################
 
 PYTHON_DPKT_VERSION = 1.7
-PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
+PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
+PYTHON_DPKT_SITE = http://dpkt.googlecode.com/files
 PYTHON_DPKT_SETUP_TYPE = distutils
+PYTHON_DPKT_LICENSE = BSD-3c
+PYTHON_DPKT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
