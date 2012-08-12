From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 18:31:31 +0200
Subject: [Buildroot] [git commit branch/next] conntrack-tools: bump to
	version 1.2.2
Message-ID: <20120812163240.A3EBF97176@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5de5a65807de9ce230c6516eef00cf26876a1ee6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/conntrack-tools/conntrack-tools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 8f1159b..6f438fc 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-CONNTRACK_TOOLS_VERSION = 1.2.1
+CONNTRACK_TOOLS_VERSION = 1.2.2
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config \
 	libnetfilter_conntrack libnetfilter_cttimeout
+CONNTRACK_TOOLS_LICENSE = GPLv2
+CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
