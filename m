From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 26 Oct 2015 17:14:35 +0000
Subject: [Buildroot] [PATCH] portmap: add a hash file
Message-ID: <1445879675-12758-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/portmap/portmap.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/portmap/portmap.hash

diff --git a/package/portmap/portmap.hash b/package/portmap/portmap.hash
new file mode 100644
index 0000000..e542b2d
--- /dev/null
+++ b/package/portmap/portmap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 02c820d39f3e6e729d1bea3287a2d8a6c684f1006fb9612f97dcad4a281d41de  portmap-6.0.tgz
-- 
1.7.1
