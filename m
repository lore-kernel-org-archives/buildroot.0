From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  3 Nov 2014 22:51:19 +0100
Subject: [Buildroot] [PATCH 2/2] tcl: add hash file
In-Reply-To: <1415051479-29611-1-git-send-email-ps.report@gmx.net>
References: <1415051479-29611-1-git-send-email-ps.report@gmx.net>
Message-ID: <1415051479-29611-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/tcl/tcl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tcl/tcl.hash

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
new file mode 100644
index 0000000..e1b3389
--- /dev/null
+++ b/package/tcl/tcl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	86f7ae5f581dd0904d04415637ab3aef5a50986c1b6d04c340e2b1b0258da9c4	tcl8.6.2-src.tar.gz
-- 
1.8.1.4
