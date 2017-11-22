From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Nov 2017 11:54:15 +1030
Subject: [Buildroot] [PATCH 1/2] pdbg: update help text
In-Reply-To: <20171122012416.25862-1-joel@jms.id.au>
References: <20171122012416.25862-1-joel@jms.id.au>
Message-ID: <20171122012416.25862-2-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the help text to reflect features added in recent versions.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/pdbg/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
index 3e23c210c920..4a902694f50c 100644
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
-- 
2.14.1
