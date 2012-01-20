From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Jan 2012 16:14:23 -0300
Subject: [Buildroot] [PATCH 2/2] openssl: security bump to version 1.0.0g
In-Reply-To: <1327086863-9470-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327086863-9470-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327086863-9470-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index a7616ba..d638ce1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0f
+OPENSSL_VERSION = 1.0.0g
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-- 
1.7.3.4
