From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:27 -0300
Subject: [Buildroot] [PATCH 13/25] gob2: bump to version 2.0.18
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gob2/gob2.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 39aa554..c557288 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -3,13 +3,10 @@
 # gob2
 #
 #############################################################
-GOB2_VERSION = 2.0.15
-GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.gz
-GOB2_SITE = http://ftp.5z.com/pub/gob/
-IPERF_CONF_ENV = ac_cv_lib_lex=-lfl
 
+GOB2_VERSION = 2.0.18
+GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
-
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
