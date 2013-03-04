From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:50:37 -0300
Subject: [Buildroot] [PATCH 3/6] nfacct: bump to version 1.0.1
In-Reply-To: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362415840-9634-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nfacct/nfacct.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index 60c6e44..cde9cad 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NFACCT_VERSION = 1.0.0
+NFACCT_VERSION = 1.0.1
 NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
-- 
1.7.12.4
