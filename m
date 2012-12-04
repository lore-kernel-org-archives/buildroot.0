From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Dec 2012 14:24:07 -0300
Subject: [Buildroot] [PATCH 3/3] jquery-sparkline: bump to version 2.1
In-Reply-To: <1354641847-5083-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354641847-5083-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354641847-5083-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-sparkline/jquery-sparkline.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index d79e762..76adad6 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -1,4 +1,4 @@
-JQUERY_SPARKLINE_VERSION = 1.6
+JQUERY_SPARKLINE_VERSION = 2.1
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
 
-- 
1.7.8.6
