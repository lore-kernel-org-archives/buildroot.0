From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 10:54:14 -0800
Subject: [Buildroot] [git commit] jquery: bump to version 1.8.3
Message-ID: <20121204190929.2AFD999716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6dbd0cd4e1337e0f68d46414174813be382a9678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery/jquery.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index fb3a1b4..871f7a0 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -1,4 +1,4 @@
-JQUERY_VERSION = 1.7.1
+JQUERY_VERSION = 1.8.3
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 
