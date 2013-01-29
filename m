From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:54 -0300
Subject: [Buildroot] [PATCH 05/10] libmpd: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmpd/libmpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index a2b9d56..9b4a1ed 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -8,5 +8,7 @@ LIBMPD_VERSION = 11.8.17
 LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
+LIBMPD_LICENSE = GPLv2+
+LIBMPD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.12.4
