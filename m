From: James Knight <james.d.knight@live.com>
Date: Tue, 6 Mar 2018 02:22:23 +0000
Subject: [Buildroot] [PATCH 2/2] inotify-tools: update license information
In-Reply-To: <20180306022209.8448-1-james.d.knight@live.com>
References: <20180306022209.8448-1-james.d.knight@live.com>
Message-ID: <BN6PR2001MB09489B7EB40B99A0BA58D32DA0D90@BN6PR2001MB0948.namprd20.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly indicate that this package is GPL v2.0+ as well as
provide a hash for the source's license file (COPYING).

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/inotify-tools/inotify-tools.hash | 1 +
 package/inotify-tools/inotify-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/inotify-tools/inotify-tools.hash b/package/inotify-tools/inotify-tools.hash
index 83ad5b9212..83dc22b4a2 100644
--- a/package/inotify-tools/inotify-tools.hash
+++ b/package/inotify-tools/inotify-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 a433cc1dedba851078276db69b0e97f9fe41e4ba3336d2971adfca4b3a6242ac inotify-tools-3.20.1.tar.gz
+sha256 e41fc126320a79ed53b5aa3386f059f7d10770856d6fd714ab80a96ce6bd09d6 COPYING
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 407aefb69f..63626307c2 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -6,7 +6,7 @@
 
 INOTIFY_TOOLS_VERSION = 3.20.1
 INOTIFY_TOOLS_SITE = $(call github,rvoicilas,inotify-tools,$(INOTIFY_TOOLS_VERSION))
-INOTIFY_TOOLS_LICENSE = GPL
+INOTIFY_TOOLS_LICENSE = GPL-2.0+
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
 INOTIFY_TOOLS_AUTORECONF = YES
-- 
2.16.2.windows.1
