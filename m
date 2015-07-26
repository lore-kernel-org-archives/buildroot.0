From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:25:36 +0200
Subject: [Buildroot] [git commit] python-dpkt: Bump version and change site
Message-ID: <20150726212545.BB4457F95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f38b397c886472169fdb1ad8594024eb7cc538c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is a closing forge, python-dpkt has already made the move to
Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-dpkt/python-dpkt.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index fb630fb..3015502 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DPKT_VERSION = 1.7
-PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE = http://dpkt.googlecode.com/files
+PYTHON_DPKT_VERSION = 1.8.r98
+PYTHON_DPKT_SITE = $(call github,kbandla,dpkt,$(PYTHON_DPKT_VERSION))
 PYTHON_DPKT_SETUP_TYPE = distutils
 PYTHON_DPKT_LICENSE = BSD-3c
 PYTHON_DPKT_LICENSE_FILES = LICENSE
