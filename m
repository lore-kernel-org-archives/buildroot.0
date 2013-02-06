From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Feb 2013 17:24:13 +0100
Subject: [Buildroot] [PATCH 5/5] ccache: define license
In-Reply-To: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1360167853-7177-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/ccache/ccache.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 1cbad6e..faa7c9f 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -7,6 +7,8 @@
 CCACHE_VERSION = 3.1.8
 CCACHE_SITE    = http://samba.org/ftp/ccache
 CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
+CCACHE_LICENSE = GPLv3+, others
+CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
 # When ccache is being built for the host, ccache is not yet
 # available, so we have to use the special C compiler without the
-- 
1.7.10.4
