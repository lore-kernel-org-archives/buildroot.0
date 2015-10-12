From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 12 Oct 2015 17:05:39 +0100
Subject: [Buildroot] [PATCH] libuv: add a hash file
Message-ID: <1444665939-46691-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libuv/libuv.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/libuv/libuv.hash

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
new file mode 100644
index 0000000..6f38b8b
--- /dev/null
+++ b/package/libuv/libuv.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 11d10f12d68fa655fff18c6021e8e45bc610e7baee006f17247b1830ee316093  libuv-v1.7.5.tar.gz
-- 
1.7.1
