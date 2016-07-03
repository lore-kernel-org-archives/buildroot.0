From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:40:55 +0200
Subject: [Buildroot] [git commit] e2tools: add explicit dependencies for
	host variant
Message-ID: <20160703064348.DE4677FE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=259c1877c3264805a485b5ab2427cc80a1b83986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2tools/e2tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 789519f..1f3bb5c 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -13,6 +13,7 @@ E2TOOLS_LICENSE = GPLv2
 E2TOOLS_LICENSE_FILES = COPYING
 E2TOOLS_DEPENDENCIES = e2fsprogs
 E2TOOLS_CONF_ENV = LIBS="-lpthread"
+HOST_E2TOOLS_DEPENDENCIES = host-e2fsprogs
 HOST_E2TOOLS_CONF_ENV = LIBS="-lpthread"
 
 $(eval $(autotools-package))
