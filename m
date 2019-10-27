From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:41:29 -0500
Subject: [Buildroot] [PATCH] package/python-scapy3k: : remove 'v' prefix
 from github-fetched packages
Message-ID: <20191027064129.14651-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python-scapy3k/python-scapy3k.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-scapy3k/python-scapy3k.mk b/package/python-scapy3k/python-scapy3k.mk
index e858dcc728..63f081e3fc 100644
--- a/package/python-scapy3k/python-scapy3k.mk
+++ b/package/python-scapy3k/python-scapy3k.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCAPY3K_VERSION = v0.18
-PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,$(PYTHON_SCAPY3K_VERSION))
+PYTHON_SCAPY3K_VERSION = 0.18
+PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,v$(PYTHON_SCAPY3K_VERSION))
 PYTHON_SCAPY3K_SETUP_TYPE = distutils
 PYTHON_SCAPY3K_LICENSE = GPL-2.0+
 
-- 
2.17.1
