From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Mar 2013 13:50:36 -0300
Subject: [Buildroot] [PATCH 2/6] libnetfilter_acct: bump to version 1.0.2
In-Reply-To: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362415840-9634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362415840-9634-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_acct/libnetfilter-acct.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetfilter_acct/libnetfilter-acct.mk b/package/libnetfilter_acct/libnetfilter-acct.mk
index 615c94c..f08fc44 100644
--- a/package/libnetfilter_acct/libnetfilter-acct.mk
+++ b/package/libnetfilter_acct/libnetfilter-acct.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNETFILTER_ACCT_VERSION = 1.0.1
+LIBNETFILTER_ACCT_VERSION = 1.0.2
 LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
-- 
1.7.12.4
