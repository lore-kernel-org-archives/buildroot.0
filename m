From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Apr 2014 08:46:25 +0300
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper: fix typo
Message-ID: <b68a795fb9acbe7d8696cf9b6f09f798e39f636c.1397108785.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/ext-toolchain-wrapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index db497844c1f7..8db4ac4214d0 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -26,7 +26,7 @@ static char sysroot[PATH_MAX];
 
 /**
  * GCC errors out with certain combinations of arguments (examples are
- * -mabi-float={hard|soft} and -m{little|big}-endian), so we have to ensure
+ * -mfloat-abi={hard|soft} and -m{little|big}-endian), so we have to ensure
  * that we only pass the predefined one to the real compiler if the inverse
  * option isn't in the argument list.
  * This specifies the worst case number of extra arguments we might pass
-- 
1.9.1
