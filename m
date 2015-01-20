From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 11:14:02 +0100
Subject: [Buildroot] [PATCH] qextserialport: add license file
Message-ID: <1421748842-32318-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/qextserialport/qextserialport.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 2949da98cd19..61f7b0503a83 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -9,6 +9,7 @@ QEXTSERIALPORT_SITE = https://qextserialport.googlecode.com/git
 QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
+QEXTSERIALPORT_LICENSE_FILES = LICENSE
 
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
-- 
2.0.0
