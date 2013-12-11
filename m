From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:35 -0300
Subject: [Buildroot] [PATCH 02/16] libsexy: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsexy/libsexy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 4f0f87c..3cfb536 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -8,5 +8,7 @@ LIBSEXY_VERSION = 0.1.11
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
+LIBSEXY_LICENSE = LGPLv2.1+
+LIBSEXY_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
