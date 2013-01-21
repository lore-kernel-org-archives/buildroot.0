From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:45 -0300
Subject: [Buildroot] [PATCH 05/10] gzip: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gzip/gzip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 0c5c124..821f694 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -6,5 +6,7 @@
 
 GZIP_VERSION = 1.5
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
+GZIP_LICENSE = GPLv3+
+GZIP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.12.4
