From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:18:17 +0100
Subject: [Buildroot] [git commit] pdbg: update help text
Message-ID: <20171122201733.7DEF8810FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f562041adce2c9212d37287a7a53a8580b2b6b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the help text to reflect features added in recent versions.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pdbg/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
index 3e23c21..4a90269 100644
--- a/package/pdbg/Config.in
+++ b/package/pdbg/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_PDBG
 	bool "pdbg"
 	help
 	  PowerPC FSI Debugger, for low level debugging of a IBM
-	  Power8 CPU over FSI.
+	  Power8 and Power9 CPU over FSI.
 
 	  pdbg runs on a BMC, which is generally an ARM-powered system
-	  monitoring/controlling a host CPU.
+	  monitoring/controlling a host CPU. It can also run on the host.
 
 	  https://github.com/open-power/pdbg
