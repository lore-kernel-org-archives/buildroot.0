From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:36 +0200
Subject: [Buildroot] [PATCH 10/12] python-dpkt: Bump version and change site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-11-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, python-dpkt has already made the move to
Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/python-dpkt/python-dpkt.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
-- 
2.1.4
