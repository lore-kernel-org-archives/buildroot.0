From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Dec 2012 14:24:05 -0300
Subject: [Buildroot] [PATCH 1/3] jquery: bump to version 1.8.3
Message-ID: <1354641847-5083-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
1.7.8.6
