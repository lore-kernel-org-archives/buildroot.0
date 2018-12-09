From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:32:59 +0100
Subject: [Buildroot] [git commit] package/proftpd: fix typoes in Config.in
 help texts
Message-ID: <20181209163051.BC66E864A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68a416f9a2b55a57638af0263eaa1faec0cb15ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mode_ -> mod_

Reported-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 478a7e80e1..3af0092339 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -29,12 +29,12 @@ config BR2_PACKAGE_PROFTPD_MOD_SFTP
 config BR2_PACKAGE_PROFTPD_MOD_SQL
 	bool "mod_sql support"
 	help
-	  Compile ProFTPD with mode_sql support.
+	  Compile ProFTPD with mod_sql support.
 
 config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
 	bool "mod_quotatab support"
 	help
-	  Compile ProFTPD with mode_quotatab support. This module
+	  Compile ProFTPD with mod_quotatab support. This module
 	  is required in order to support quota tables:
 	        1. mod_quotatab_file
 	        2. mod_quotatab_ldap
