From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 May 2017 19:01:27 +0200
Subject: [Buildroot] [PATCH 5/6] snmppp: fix help text format
In-Reply-To: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
References: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1496163688-20870-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/snmppp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 9e800fd57ea8..8d284673bc4c 100644
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
-- 
2.7.4
