From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2015 00:31:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gpm: add hash file
Message-ID: <1434407464-15812-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2:
- added missing hash file
- keep tar.bz2
---
 package/gpm/gpm.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gpm/gpm.hash

diff --git a/package/gpm/gpm.hash b/package/gpm/gpm.hash
new file mode 100644
index 0000000..1f8994b
--- /dev/null
+++ b/package/gpm/gpm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  f011b7dc7afb824e0a017b89b7300514e772853ece7fc4ee640310889411a48d  gpm-1.20.7.tar.bz2
-- 
1.8.0
