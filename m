From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] linux-zigbee: add comment mmu depends
Message-ID: <20140804163002.8FC2D9D1A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13cdf39b393cdee6e8ffab2b5aa1b0b7f8acb955
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-zigbee/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-zigbee/Config.in b/package/linux-zigbee/Config.in
index 555e859..fc21faa 100644
--- a/package/linux-zigbee/Config.in
+++ b/package/linux-zigbee/Config.in
@@ -1,5 +1,6 @@
 comment "linux-zigbee needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_LINUX_ZIGBEE
 	bool "linux-zigbee"
