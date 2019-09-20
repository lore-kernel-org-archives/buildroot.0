From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 13:30:02 +0200
Subject: [Buildroot] [PATCH] package/joe: license is GPL-2.0+
Message-ID: <20190920113003.21711-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joe changed the COPYING file from GPL-1.0 to GPL-2.0 in the development
leading up to 3.8:

https://sourceforge.net/p/joe-editor/mercurial/ci/d731f9b3794bc4c896f2efa1c97ac2c82c3365ac/

So change the license to GPL-2.0+

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/joe/joe.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index 9a3215c4e1..f0cac402e1 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -6,7 +6,7 @@
 
 JOE_VERSION = 4.6
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
-JOE_LICENSE = GPL-1.0+
+JOE_LICENSE = GPL-2.0+
 JOE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-- 
2.20.1
