From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 28 Jun 2017 23:45:46 -0300
Subject: [Buildroot] [PATCH 6/9] support/testing: fix code style in emulator
In-Reply-To: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
References: <20170629024549.30484-1-ricardo.martincoski@gmail.com>
Message-ID: <20170629024549.30484-7-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove unused import.
Use 2 empty lines before a class.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
This patch depends on previous ones because some code with style issues
were replaced by equivalent code.

After this patch
$ flake8 support/testing/infra/emulator.py
shows no error or warning.
---
 support/testing/infra/emulator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 7407309a29..0f925fc9fb 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,7 +1,7 @@
 import pexpect
 
 import infra
-import infra.basetest
+
 
 class Emulator(object):
 
-- 
2.11.0
