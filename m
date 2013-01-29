From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:57 -0300
Subject: [Buildroot] [PATCH 08/10] liboping: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liboping/liboping.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index e253fbd..d852ef9 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -9,5 +9,7 @@ LIBOPING_SITE = http://verplant.org/liboping/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPT = --without-perl-bindings
+LIBOPING_LICENSE = LGPLv2.1+ GPLv2
+LIBOPING_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
-- 
1.7.12.4
