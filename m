From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:47:12 +0200
Subject: [Buildroot] [git commit] xvkbd: add license information
Message-ID: <20140701224922.94C4E9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a9ffb9f1204fec1338e17b61f7dec1fbc72290b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use README as license file]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvkbd/xvkbd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 15aa940..0411fa4 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -6,6 +6,8 @@
 
 XVKBD_VERSION = 3.2
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
+XVKBD_LICENSE = GPLv2+
+XVKBD_LICENSE_FILES = README
 
 # Passing USRLIBDIR ensures that the stupid Makefile doesn't add
 # /usr/lib to the library search path.
