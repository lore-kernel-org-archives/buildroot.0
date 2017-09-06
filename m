From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 12:35:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/iucode-tool: fix
	upstream source URL
Message-ID: <20170906112607.EE6B28211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dba28fce17407b64c088b14eee3545b6c846285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9f2369b5f078df99ea32d14e30803f3c46200c07)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iucode-tool/iucode-tool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index cee0572..1dfda70 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -6,7 +6,7 @@
 
 IUCODE_TOOL_VERSION = 1.5
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
-IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/latest
+IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
