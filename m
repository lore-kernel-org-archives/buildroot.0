From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:25 -0300
Subject: [Buildroot] [PATCH 19/54] libv4l: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libv4l/libv4l.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f62a4b6..56523d0 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -10,6 +10,8 @@ LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_MAKE_OPTS = PREFIX=/usr
 LIBV4L_DEPENDENCIES = jpeg
+LIBV4L_LICENSE = GPLv2+ (utiltiies), LGPLv2.1+ (libraries)
+LIBV4L_LICENSE_FILES = COPYING COPYING.LIB
 
 LIBV4L_DIRS_y += lib
 LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/libv4l2util utils/decode_tm6000
-- 
1.8.5.5
