From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:24:20 +0200
Subject: [Buildroot] [git commit] dhcpdump: add project URL
Message-ID: <20151020203207.ECBC481EC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3449a94838655edfc8d52422ac57baa78aff7a86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use more specific page]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpdump/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index 1840e34..e0abe04 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -3,3 +3,5 @@ config BR2_PACKAGE_DHCPDUMP
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
+
+	  http://www.mavetju.org/unix/general.php
