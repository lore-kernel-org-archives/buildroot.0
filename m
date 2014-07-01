From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:32:49 +0200
Subject: [Buildroot] [git commit] ezxml: add license information
Message-ID: <20140701153344.40D359CE74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e09321d096ef15df371bc4f1375b02054a8b9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ezxml/ezxml.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 139bf64..7693466 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -7,6 +7,8 @@
 EZXML_VERSION = 0.8.6
 EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
 EZXML_INSTALL_STAGING = YES
+EZXML_LICENSE = MIT
+EZXML_LICENSE_FILES = license.txt
 
 define EZXML_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
