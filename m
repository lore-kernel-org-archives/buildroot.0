From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:07:56 +0100
Subject: [Buildroot] [git commit] package/ipsec-tools: fix broken download
	URL
Message-ID: <20160207211554.6FD65802CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c7a6f522053bbff8066106eb4f67ab83d0c4273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/ipsec-tools.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 9454c4e..98216ea 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-IPSEC_TOOLS_VERSION_MAJOR = 0.8
-IPSEC_TOOLS_VERSION = $(IPSEC_TOOLS_VERSION_MAJOR).2
+IPSEC_TOOLS_VERSION = 0.8.2
 IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/$(IPSEC_TOOLS_VERSION_MAJOR)
+IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
 IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
