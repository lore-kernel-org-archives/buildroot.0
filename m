From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:51 -0000
Subject: [Buildroot] [git commit branch/next] openipmi: add homepage URL
Message-ID: <20150808105640.892BF8190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17e487f74612e0123259f80a3ebba0177399b7ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The homepage is now back online.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openipmi/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openipmi/Config.in b/package/openipmi/Config.in
index 667efa7..da88657 100644
--- a/package/openipmi/Config.in
+++ b/package/openipmi/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_OPENIPMI
 	  to interact with IPMI enabled devices. OpenIPMI also provides
 	  an IPMI BMC simulator.
 
+	  http://openipmi.sourceforge.net
+
 comment "openipmi needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
