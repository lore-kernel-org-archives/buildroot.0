From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:41:45 +0200
Subject: [Buildroot] [git commit branch/next] package/unixodbc: bump version
	to 2.3.4
Message-ID: <20160827124154.84E877FD50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b141fcebd03a170fe05681dbb92524f7ea11f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/unixodbc/unixodbc.hash | 6 ++++--
 package/unixodbc/unixodbc.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index a5c2d11..e99169c 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,2 +1,4 @@
-# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.2.tar.gz.md5
-md5	5e4528851eda5d3d4aed249b669bd05b	unixODBC-2.3.2.tar.gz
+# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.4.tar.gz.md5
+md5 bd25d261ca1808c947cb687e2034be81  unixODBC-2.3.4.tar.gz
+# Locally computed
+sha256 2e1509a96bb18d248bf08ead0d74804957304ff7c6f8b2e5965309c632421e39  unixODBC-2.3.4.tar.gz
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 067c1ca..f66daab 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.2
+UNIXODBC_VERSION = 2.3.4
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
