From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Dec 2015 12:29:42 +0000
Subject: [Buildroot] [PATCH 3/4] torsmo: add a hash file
In-Reply-To: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1449059383-62131-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/torsmo/torsmo.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/torsmo/torsmo.hash

diff --git a/package/torsmo/torsmo.hash b/package/torsmo/torsmo.hash
new file mode 100644
index 0000000..8bbf9dc
--- /dev/null
+++ b/package/torsmo/torsmo.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6a6bc82e71c841ba9359f0ffe370e57ef7b04b49a448252bb0c1c28fc10e964c  torsmo-0.18.tar.gz
-- 
2.4.10
