From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 22 Oct 2019 19:48:02 -0300
Subject: [Buildroot] [PATCH] package/numactl: fix URL in help text
Message-ID: <20191022224802.4975-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

SGI is gone (RIP). Use the github project as landing page.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
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
-- 
2.18.1
