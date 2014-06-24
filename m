From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:36 -0300
Subject: [Buildroot] [PATCH 30/54] python-dpkt: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-30-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-dpkt/python-dpkt.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
1.8.5.5
