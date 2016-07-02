From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:38 +0200
Subject: [Buildroot] [PATCH 09/69] e2tools: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-10-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/e2tools/e2tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 789519fe8d4f..24d91be91a3b 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -12,6 +12,7 @@ E2TOOLS_AUTORECONF = YES
 E2TOOLS_LICENSE = GPLv2
 E2TOOLS_LICENSE_FILES = COPYING
 E2TOOLS_DEPENDENCIES = e2fsprogs
+HOST_E2TOOLS_DEPENDENCIES = host-e2fsprogs
 E2TOOLS_CONF_ENV = LIBS="-lpthread"
 HOST_E2TOOLS_CONF_ENV = LIBS="-lpthread"
 
-- 
2.1.0
