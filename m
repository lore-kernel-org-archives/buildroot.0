From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Jul 2013 10:23:53 +0200
Subject: [Buildroot] [PATCH] eglibc: fix typo
Message-ID: <1373012633-3767-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, a '+' sign was left at the beginning of a line in
eglibc.mk. Noticed by Gustavo Zacarias.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eglibc/eglibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index ec80d5e..bb81757 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -19,7 +19,7 @@ EGLIBC_SUBDIR = build
 
 EGLIBC_INSTALL_STAGING = YES
 
-+EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
+EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install
 
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
-- 
1.8.1.2
