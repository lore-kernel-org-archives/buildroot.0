From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 21:55:03 +0100
Subject: [Buildroot] [git commit] quagga: fix typo s/BPG/BGP/
Message-ID: <20161125205537.C64647FDFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c029a7acc2023d171aafd3e9f546a950c8c3264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #9431.

Reported-by: xichaoli <xichao@sina.cn>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quagga/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 56b8cad..4eacaf0 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -25,9 +25,9 @@ config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	  on different hosts.
 
 config BR2_PACKAGE_QUAGGA_BGPD
-	bool "BPGv4+ protocol"
+	bool "BGPv4+ protocol"
 	help
-	  Build bpgd daemon.
+	  Build bgpd daemon.
 
 config BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE
 	bool "BGP route announcement"
