From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:11:19 +0100
Subject: [Buildroot] [PATCH 05/13] toolchain: add hidden symbol for fortran
	support in the toolchain
In-Reply-To: <1467040287-39390-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040287-39390-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040287-39390-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This symbol should be used in all packages requiring/testing for fortran
support.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-common.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1fe28a9..232377f 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -21,6 +21,9 @@ config BR2_ENABLE_LOCALE
 config BR2_INSTALL_LIBSTDCPP
 	bool
 
+config BR2_TOOLCHAIN_HAS_FORTRAN
+	bool
+
 config BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
-- 
2.7.3
