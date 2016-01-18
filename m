From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 10:09:38 +0100
Subject: [Buildroot] [git commit] package/micropython: bump to version 1.5.2
Message-ID: <20160118091230.D9C4F82718@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42971b1e629d3fb52c6c327dc31eb0235fb1a45d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 24b878e..0c9e2ae 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 4ba128def442275ef528c210d8d3dc6d6e12460069a570706b5fbdb6b4a6a25f  micropython-v1.5.tar.gz
+sha256 3c594ee701622f01c4e9c7abd1c322a0bc6c8af17bea0b0126812cb8e61bb5d9  micropython-v1.5.2.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 2126f15..59d164f 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.5
+MICROPYTHON_VERSION = v1.5.2
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
