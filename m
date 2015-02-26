From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:58:53 +0100
Subject: [Buildroot] [git commit branch/next] xz: bump to version 5.2.1
Message-ID: <20150226220121.5094F817EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e3bbebf4de803f790f6217e12289d1a7ba59447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash |    2 +-
 package/xz/xz.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 9a5a9ff..da523d9 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  f7357d7455a1670229b3cca021da71dd5d13b789db62743c20624bdffc9cc4a5  xz-5.2.0.tar.bz2
+sha256  679148f497e0bff2c1adce42dee5a23f746e71321c33ebb0f641a302e30c2a80  xz-5.2.1.tar.bz2
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 413c020..503275c 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.0
+XZ_VERSION = 5.2.1
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
