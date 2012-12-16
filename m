From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Dec 2012 08:52:16 -0300
Subject: [Buildroot] [PATCH 2/3] libxslt: bump to version 1.1.28
In-Reply-To: <1355658737-29879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1355658737-29879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1355658737-29879-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxslt/libxslt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index aa594c2..a35b955 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBXSLT_VERSION = 1.1.27
+LIBXSLT_VERSION = 1.1.28
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
-- 
1.7.8.6
