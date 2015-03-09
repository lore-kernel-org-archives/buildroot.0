From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Mar 2015 22:58:08 +0100
Subject: [Buildroot] [git commit] ustr: fix license name
Message-ID: <20150309220857.DB2C17FDE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=606a39ef1209631c71086239cc8b46cfe3af1338
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ustr/ustr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index ac1fa05..c2a819f 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -8,7 +8,7 @@ USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
 USTR_LICENSE = BSD-2c MIT LGPLv2+
-USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
+USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 
 USTR_INSTALL_STAGING = YES
 
