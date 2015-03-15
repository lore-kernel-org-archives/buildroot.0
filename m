From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:13:20 +0100
Subject: [Buildroot] [git commit] bandwidthd: remove postgresql introduced
	uclibc dependency
Message-ID: <20150315181408.47AC980799@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64af4e243cfc1c42c8aacc5f3609f5c340a2f3c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bandwidthd/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index c1f0ee1..0d51f5e 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -32,7 +32,6 @@ if BR2_PACKAGE_BANDWIDTHD
 
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
-	depends on BR2_TOOLCHAIN_USES_GLIBC # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable support for logging the bandwidthd data to a remote
