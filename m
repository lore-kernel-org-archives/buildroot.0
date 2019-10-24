From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2019 11:05:23 +0200
Subject: [Buildroot] [git commit] package/numactl: fix URL in help text
Message-ID: <20191024085915.919A384346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5ff55822db50214548377cf025c98d4ee2495d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SGI is gone (RIP). Use the github project as landing page.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/numactl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index 95057d3c33..8ea07bb856 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_NUMACTL
 	  and memory nodes. It does this by supplying a NUMA memory
 	  policy to the operating system before running your program.
 
-	  http://oss.sgi.com/projects/libnuma/
+	  https://github.com/numactl/numactl
