From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 22:46:20 +0200
Subject: [Buildroot] [git commit branch/next] package/ltp-testsuite: enable
 ebizzy
Message-ID: <20210518201733.C33228143C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e18ebde613d297e470f9a219a32bf535dccc2013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ebizzy has been fixed in 20200930 (commit 967612c45).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ltp-testsuite/ltp-testsuite.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 43ee134d1c..978d01b7a6 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -76,8 +76,7 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
-	testcases/kernel/syscalls/timer_create/timer_create03.c \
-	utils/benchmark/ebizzy-0.3
+	testcases/kernel/syscalls/timer_create/timer_create03.c
 
 # ldd command build system tries to build a shared library unconditionally.
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_STATIC_LIBS) += \
