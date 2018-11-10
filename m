From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Nov 2018 18:48:47 +0100
Subject: [Buildroot] [PATCH/next 2/2] trace-cmd: bump to version 2.7
In-Reply-To: <20181110174847.19674-1-fontaine.fabrice@gmail.com>
References: <20181110174847.19674-1-fontaine.fabrice@gmail.com>
Message-ID: <20181110174847.19674-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trace-cmd/trace-cmd.hash | 4 +++-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 5bf4154bd0..c6447f34d4 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 f088534808274f6233fe15130791238fb14ce9bf6e7234f9b3fe6b5a42a1245d  trace-cmd-trace-cmd-v2.6.1.tar.gz
+sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 578e9f124f..dfca6a170d 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.6.1
+TRACE_CMD_VERSION = trace-cmd-v2.7
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
-- 
2.17.1
