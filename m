From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 14:25:30 +0000
Subject: [Buildroot] [PATCH 4/4] libplist: add a hash file
In-Reply-To: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448461530-56142-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1448461530-56142-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libplist/libplist.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libplist/libplist.hash

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
new file mode 100644
index 0000000..06d1b16
--- /dev/null
+++ b/package/libplist/libplist.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0effdedcb3de128c4930d8c03a3854c74c426c16728b8ab5f0a5b6bdc0b644be  libplist-1.12.tar.bz2
-- 
2.4.10
