From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 18:20:53 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/batman-adv: add
 note about linux mainline kernel module alternative
Message-ID: <20210323170604.7EF7884497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f86de3280c4921994a967f0aa9ec95dc09307342
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Since version 2.6.38 batman-adv is integreated into the linux mainline
kernel ([1], [2]) so add a note about it in the Config.in help text.

[1] https://kernelnewbies.org/Linux_2_6_38
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6c8fea29769d998d94fcec9b9f14d4b52b349d3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8ec31f1bc325d8544c8da2922d857272900f3ded)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/batman-adv/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
index 9d3d7967b9..eae94fd130 100644
--- a/package/batman-adv/Config.in
+++ b/package/batman-adv/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_BATMAN_ADV
 	depends on BR2_LINUX_KERNEL
 	help
 	  batman-adv mesh networking kernel module
+	  Note: batman-adv is part of the linux mainline
+	  kernel since version 2.6.38
 
 	  https://www.open-mesh.org/projects/batman-adv/
 
