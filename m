From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:41 +0200
Subject: [Buildroot] [PATCH v3 20/22] pcre: define license
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-20-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pcre/pcre.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index db896fd..d01ca84 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -6,6 +6,8 @@
 
 PCRE_VERSION = 8.30
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_LICENSE = BSD-3c
+PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
1.7.5.4
