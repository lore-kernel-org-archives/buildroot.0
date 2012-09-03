From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:36 -0000
Subject: [Buildroot] [git commit] iptables: bump to version 1.4.15
Message-ID: <20120903200535.1F2349953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b96e11f0a1cd91256c6fede83030aa1369b4794a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptables/iptables.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index a5ec6a7..bdef575 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.14
+IPTABLES_VERSION = 1.4.15
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
 IPTABLES_DEPENDENCIES = host-pkg-config
+IPTABLES_LICENSE = GPLv2
+IPTABLES_LICENSE_FILES = COPYING
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 
