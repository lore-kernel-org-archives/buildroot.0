From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 16:05:14 +0200
Subject: [Buildroot] [git commit] support/testing: fix code style in emulator
Message-ID: <20170701140852.0F40A8079F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abe64676d58c6099f363cd6b2199d7804a9bf953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove unused import.
Use 2 empty lines before a class.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/emulator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 7407309..0f925fc 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,7 +1,7 @@
 import pexpect
 
 import infra
-import infra.basetest
+
 
 class Emulator(object):
 
