From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:33:19 +0200
Subject: [Buildroot] [git commit] snmppp: adjust toolchain comment for
	new-style format
Message-ID: <20131014204835.2EC269B9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82c44b3f0f530a8f5feabbf95009d7372dffebb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 9757814..5d6d749 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_SNMPPP
 
 	  http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
 
-comment "snmp++ requires a toolchain with threads and C++ support enabled"
+comment "snmp++ needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
