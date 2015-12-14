From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Dec 2015 15:00:36 +0000
Subject: [Buildroot] [PATCH 2/2] trinity: add a hash file
In-Reply-To: <1450105236-11224-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450105236-11224-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1450105236-11224-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/trinity/trinity.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/trinity/trinity.hash

diff --git a/package/trinity/trinity.hash b/package/trinity/trinity.hash
new file mode 100644
index 0000000..e290a40
--- /dev/null
+++ b/package/trinity/trinity.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3ef7ae05dba14f8bb626121983a08bb09d1d51a19de38bd9a8e0f29b11d9e3c9  trinity-v1.6.tar.gz
-- 
2.4.10
