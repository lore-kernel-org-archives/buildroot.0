From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jun 2012 12:30:44 -0300
Subject: [Buildroot] [PATCH 5/7] bison: bump to version 2.5.1
In-Reply-To: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1339169446-26972-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index a1de39a..51325bd 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BISON_VERSION = 2.5
+BISON_VERSION = 2.5.1
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 
 BISON_CONF_ENV += ac_cv_path_M4=/usr/bin/m4
-- 
1.7.3.4
