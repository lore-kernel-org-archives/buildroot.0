From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 18:38:55 +0100
Subject: [Buildroot] [git commit] inotify-tools: update license information
Message-ID: <20180311174355.5723B7FE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d56bb4f6fa839aaa26b5d27bd047edb446f14a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly indicate that this package is GPL v2.0+ as well as
provide a hash for the source's license file (COPYING).

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
