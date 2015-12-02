From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Dec 2015 12:29:41 +0000
Subject: [Buildroot] [PATCH 2/4] libglu: add a hash file
In-Reply-To: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1449059383-62131-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libglu/libglu.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libglu/libglu.hash

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
new file mode 100644
index 0000000..6e4e4fd
--- /dev/null
+++ b/package/libglu/libglu.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3d19cca9b26ec4048dd22e3d294acd43e080a3205a29ff47765bd514571ea8f9  glu-9.0.0.tar.gz
-- 
2.4.10
