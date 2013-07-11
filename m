From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jul 2013 14:04:40 +0200
Subject: [Buildroot] [git commit] jquery: bump to version 1.10.2
Message-ID: <20130711131225.EE9159A3C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca6fbbe1ba290b88dabfac49a6623644fba6b878
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery/jquery.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 44c444b..e76754f 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VERSION = 1.10.1
+JQUERY_VERSION = 1.10.2
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
