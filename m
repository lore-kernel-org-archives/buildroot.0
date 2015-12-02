From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Dec 2015 12:29:40 +0000
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
Message-ID: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dhrystone/dhrystone.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dhrystone/dhrystone.hash

diff --git a/package/dhrystone/dhrystone.hash b/package/dhrystone/dhrystone.hash
new file mode 100644
index 0000000..9ea22a3
--- /dev/null
+++ b/package/dhrystone/dhrystone.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
-- 
2.4.10
