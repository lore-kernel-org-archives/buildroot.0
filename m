From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:24:30 +0200
Subject: [Buildroot] [git commit] ext-toolchain-wrapper: fix typo
Message-ID: <20140410204504.27EFE9C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c768421073875caa156f3ad6da413dd6be63595
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/ext-toolchain-wrapper.c     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index db49784..8db4ac4 100644
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
