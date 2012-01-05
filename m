From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2012 15:26:16 -0300
Subject: [Buildroot] [PATCH 03/10] links: bump to version 2.5
In-Reply-To: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
References: <1325787983-8591-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1325787983-8591-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/links/links.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 470b13d..52a71f1 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LINKS_VERSION = 2.3pre2
+LINKS_VERSION = 2.5
 LINKS_SITE = http://links.twibright.com/download
 LINKS_CONF_OPT = --without-x
 LINKS_DEPENDENCIES = host-pkg-config
-- 
1.7.3.4
