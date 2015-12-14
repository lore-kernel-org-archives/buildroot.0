From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Dec 2015 14:17:01 +0000
Subject: [Buildroot] [PATCH 2/2] expedite: add a hash file
In-Reply-To: <1450102621-33053-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450102621-33053-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1450102621-33053-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/expedite/expedite.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/expedite/expedite.hash

diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
new file mode 100644
index 0000000..cde3689
--- /dev/null
+++ b/package/expedite/expedite.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 91d0290ba3635a4440c389647643beaa8e39def2789d685d54a58a723398cc10  expedite-1.7.10.tar.bz2
-- 
2.4.10
