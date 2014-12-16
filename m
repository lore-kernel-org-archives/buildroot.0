From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 11:08:20 -0300
Subject: [Buildroot] [PATCH 6/6] sudo: adjust libtool comment
In-Reply-To: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418738900-16150-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418738900-16150-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 61635ec..df3910e 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -8,7 +8,8 @@ SUDO_VERSION = 1.8.10p3
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-# Ships a non-release libtool that isn't patch-friendly
+# Ships a beta libtool version hence our patch doesn't apply.
+# Run autoreconf to regenerate ltmain.sh.
 SUDO_AUTORECONF = YES
 SUDO_CONF_OPTS = \
 		--without-lecture \
-- 
2.0.4
