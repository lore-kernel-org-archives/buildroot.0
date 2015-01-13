From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:40:04 +0100
Subject: [Buildroot] [PATCH v3 4/7] dtc: add hash
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <1421178007-11877-5-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dtc/dtc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dtc/dtc.hash

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
new file mode 100644
index 0000000..8b3af33
--- /dev/null
+++ b/package/dtc/dtc.hash
@@ -0,0 +1,2 @@
+# from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
+sha256 77992ad8eac7b68f553d0ba58e5b51604ac803d126196c99e3ae38aaae28bb94  dtc-1.4.1.tar.xz
-- 
2.1.2
