From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:40 -0300
Subject: [Buildroot] [PATCH 07/16] libdvdread: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdread/libdvdread.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index f7c59af..35d7548 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,5 +11,7 @@ LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_CONFIG_SCRIPTS = dvdread-config
+LIBDVDREAD_LICENSE = GPLv2+
+LIBDVDREAD_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
