From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Nov 2009 15:57:30 +0100
Subject: [Buildroot] [git commit master] libidn: Update Config.in to fulfill
	LIBIDN_BINARY
Message-ID: <20091116145841.26053777BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=638a4214f882f8f0478bcdec3678c23cf79ca02c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libidn/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index 19e207f..793fbc3 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -5,3 +5,9 @@ config BR2_PACKAGE_LIBIDN
 	  domain names. 
 
 	  http://www.gnu.org/software/libidn/
+
+config BR2_PACKAGE_LIBIDN_BINARY
+	bool "idn binary"
+	depends on BR2_PACKAGE_LIBIDN
+	help
+	  Install idn command line tool
-- 
1.6.3.3
