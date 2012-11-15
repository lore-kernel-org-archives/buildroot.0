From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 14:30:13 +0100
Subject: [Buildroot] [PATCH 3/5] uClibc: update uClibc-snapshot.config to
	recent uClibcs
In-Reply-To: <cover.1352986210.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352986210.git.thomas.petazzoni@free-electrons.com>
Message-ID: <381cb7191e4a7dae6e4dd649df65289635f10b1f.1352986210.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/uClibc-snapshot.config |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index eb39df6..71fa472 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -93,6 +93,7 @@ LDSO_PRELOAD_ENV_SUPPORT=y
 # LDSO_PRELINK_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
 LDSO_RUNPATH=y
+LDSO_SAFE_RUNPATH=y
 LDSO_SEARCH_INTERP_PATH=y
 LDSO_LD_LIBRARY_PATH=y
 # LDSO_NO_CLEANUP is not set
-- 
1.7.9.5
