From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Dec 2015 12:29:43 +0000
Subject: [Buildroot] [PATCH 4/4] whetstone: add a hash file
In-Reply-To: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1449059383-62131-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/whetstone/whetstone.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/whetstone/whetstone.hash

diff --git a/package/whetstone/whetstone.hash b/package/whetstone/whetstone.hash
new file mode 100644
index 0000000..db9bbb4
--- /dev/null
+++ b/package/whetstone/whetstone.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf  whetstone.c
-- 
2.4.10
