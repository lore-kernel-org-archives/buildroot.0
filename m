From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 08 Oct 2013 15:59:29 +0800
Subject: [Buildroot] [PATCH v2] stress: add license information
Message-ID: <1381219169.25212.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Below is the reply from Amos:
I think autogen "helpfully" copied in the wrong COPYING file.
I've reverted it to GPLv2, which is the true license of the project,
and released a new tar archive:

 http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz

The new archive should have SHA-2 signature:

 f6642ae62ae0eb16368bce29181a15c7743129ea51c7184f45e161e21db3360b

Thanks,

Amos
 package/stress/stress.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 6e82b50..387166d 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -6,6 +6,8 @@
 
 STRESS_VERSION = 1.0.4
 STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
+STRESS_LICENSE = GPLv2+
+STRESS_LICENSE_FILES = COPYING
 STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
-- 
1.8.1.2
