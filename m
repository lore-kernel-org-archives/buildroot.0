From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 11:08:18 -0300
Subject: [Buildroot] [PATCH 4/6] lzo: adjust libtool comment
In-Reply-To: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418738900-16150-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lzo/lzo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 9f0729a..a94b5f5 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -9,7 +9,7 @@ LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
-# Our libtool patch does not apply to bundled ltmain.sh since it's too new.
+# Ships a beta libtool version hence our patch doesn't apply.
 # Run autoreconf to regenerate ltmain.sh.
 LZO_AUTORECONF = YES
 
-- 
2.0.4
