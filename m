From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:20:17 +0200
Subject: [Buildroot] [git commit] snmppp: fix help text format
Message-ID: <20170530212121.A05A3829FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae8704c7529e7c293f7f040412f199507939f61b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snmppp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 9e800fd..8d28467 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -14,8 +14,9 @@ config BR2_PACKAGE_SNMPPP_LOGGING
 	bool "enable logging"
 	help
 	  Enable logging output for SNMP++.
-	  According to the SNMP++ documentation, disabling logging "increases
-	  performance drastically and minimizes memory consumption".
+	  According to the SNMP++ documentation, disabling logging
+	  "increases performance drastically and minimizes memory
+	  consumption".
 
 config BR2_PACKAGE_SNMPPP_SNMPV3
 	bool "enable SNMPv3"
