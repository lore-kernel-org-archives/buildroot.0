From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:13 +0200
Subject: [Buildroot] [PATCH v4 14/22] bzip2: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-15-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/bzip2/bzip2.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 1bc4449..611e5a0 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -7,6 +7,8 @@ BZIP2_VERSION:=1.0.5
 BZIP2_SONAME=1.0.4
 BZIP2_SOURCE:=bzip2-$(BZIP2_VERSION).tar.gz
 BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VERSION)
+BZIP2_LICENSE = bzip2 license
+BZIP2_LICENSE_FILES = LICENSE
 BZIP2_INSTALL_STAGING=YES
 
 define BZIP2_FIX_MAKEFILE
-- 
1.7.9.5
