From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:40 +0200
Subject: [Buildroot] [PATCH v3 04/14] toolchain: add hidden symbol for
	fortran support in the toolchain
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This symbol should be used in all packages requiring/testing for fortran
support.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
changes v1->v2:
- none

changes v2->v3:
- update A/R/T tags
---
 toolchain/toolchain-common.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 96ce3d1..65df31b 100644
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
2.9.0
