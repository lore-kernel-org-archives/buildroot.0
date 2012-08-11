From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:40 +0200
Subject: [Buildroot] [PATCH 08/20] netkitbase: mark as deprecated
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f52be43b39fad0c345e927673b039cd0eaddfe65.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is no longer being developed, the FTP is dead, and Debian has
removed it from the distribution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netkitbase/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index 75bd728..dd9166c 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_DEPRECATED
 	help
 	  Old-style inetd.
 
-- 
1.7.9.5
