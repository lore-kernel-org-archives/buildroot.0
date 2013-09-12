From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 09:42:24 +0200
Subject: [Buildroot] [git commit] ser2net: bump to version 2.9.1
Message-ID: <20130912080443.1AE499B725@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dbc737d604d35c6d8155896320ecf736b6f8870
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ser2net/ser2net.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 23ae48a..5e77d36 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.9
+SER2NET_VERSION = 2.9.1
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
-# shipped configure script is broken (libtool version error)
-SER2NET_AUTORECONF = YES
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
