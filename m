From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2021 18:06:24 +0100
Subject: [Buildroot] [git commit] support/testing: fix flake8 issue in CPE
 ID test
Message-ID: <20210102165009.D84C38283F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=728484538a803bb0c7eef8dca48580c3e5ac99af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/core/test_cpeid.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/core/test_cpeid.py b/support/testing/tests/core/test_cpeid.py
index 23471e4444..acac8c3adf 100644
--- a/support/testing/tests/core/test_cpeid.py
+++ b/support/testing/tests/core/test_cpeid.py
@@ -2,6 +2,7 @@ import infra
 import subprocess
 import json
 
+
 class CpeIdTest(infra.basetest.BRConfigTest):
     config = ""
     br2_external = [infra.filepath("tests/core/cpeid-br2-external")]
