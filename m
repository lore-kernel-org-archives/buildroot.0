From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 21 Oct 2015 10:30:15 +0100
Subject: [Buildroot] [PATCH 3/3] minicom: add a hash file
In-Reply-To: <1445419815-24985-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445419815-24985-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1445419815-24985-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/minicom/minicom.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 package/minicom/minicom.hash

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
new file mode 100644
index 0000000..33ba4ef
--- /dev/null
+++ b/package/minicom/minicom.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4  minicom-2.7.tar.gz
-- 
1.7.1
