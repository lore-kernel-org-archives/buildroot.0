From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 12:17:59 +0000
Subject: [Buildroot] [PATCH 1/2] rubix: add a hash file
Message-ID: <1448453880-62053-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/rubix/rubix.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rubix/rubix.hash

diff --git a/package/rubix/rubix.hash b/package/rubix/rubix.hash
new file mode 100644
index 0000000..90fc9cd
--- /dev/null
+++ b/package/rubix/rubix.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d3c6bf8bfa891e72baac0250a79d26045ddb4412b72d90de7c46091c07516b43  rubix-1.0.5.tar.bz2
-- 
2.4.10
