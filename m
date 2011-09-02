From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:55 -0300
Subject: [Buildroot] [PATCH 07/13] libao: bump to version 1.1.0
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/libao/libao.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libao/libao.mk b/package/multimedia/libao/libao.mk
index ee02d18..83d3154 100644
--- a/package/multimedia/libao/libao.mk
+++ b/package/multimedia/libao/libao.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBAO_VERSION = 1.0.0
+LIBAO_VERSION = 1.1.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkg-config
 LIBAO_INSTALL_STAGING = YES
-- 
1.7.3.4
