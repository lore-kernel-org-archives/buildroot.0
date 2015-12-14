From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:50 -0300
Subject: [Buildroot] [PATCH 11/45] liboping: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liboping/liboping.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index aeaaa8a..94de73c 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -9,7 +9,7 @@ LIBOPING_SITE = http://noping.cc/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
-LIBOPING_LICENSE = LGPLv2.1+ GPLv2
+LIBOPING_LICENSE = LGPLv2.1+, GPLv2
 LIBOPING_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
2.4.10
