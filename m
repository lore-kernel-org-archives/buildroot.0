From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:29:50 +0100
Subject: [Buildroot] [git commit] lirc-tools: needs host-python3
Message-ID: <20160320143021.F26678078C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3694ed7d75f62f4771da9032d4889e8ce4316a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated in NEWS "Build scripts now requires python3". Fixes:
http://autobuild.buildroot.net/results/f41/f417a17ad24eec8f72402a634588c6b3af8293be/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/lirc-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 2e437a6..46886a9 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -9,7 +9,7 @@ LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
-LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf
+LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
