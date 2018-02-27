From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:28 -0600
Subject: [Buildroot] [NEXT 13/26] glibc: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-14-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/glibc/glibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0351433..8553cd6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -25,6 +25,8 @@ GLIBC_SRC_SUBDIR = .
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
+GLIBC_CPE_ID = gnu:$(GLIBC_NAME):$(GLIBC_VERSION)
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
1.9.1
