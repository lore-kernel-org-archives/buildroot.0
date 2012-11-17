From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 22:08:19 +0100
Subject: [Buildroot] [git commit] hiawatha: bump to version 8.6
Message-ID: <20121117210904.6844D9A07E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56cbd27a4c14709163ec5437c41a8a046631b8c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hiawatha/hiawatha.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 79546e3..bd9da43 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,5 +1,5 @@
-HIAWATHA_VERSION = 8.5
-HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
+HIAWATHA_VERSION = 8.6
+HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_LICENSE = GPLv2
 HIAWATHA_LICENSE_FILES = LICENSE
 
