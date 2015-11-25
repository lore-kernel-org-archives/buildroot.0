From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 Nov 2015 12:04:06 +0000
Subject: [Buildroot] [PATCH] localedef: add a hash file
Message-ID: <1448453046-30116-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/localedef/localedef.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/localedef/localedef.hash

diff --git a/package/localedef/localedef.hash b/package/localedef/localedef.hash
new file mode 100644
index 0000000..ee14fb1
--- /dev/null
+++ b/package/localedef/localedef.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9a60f7cdab6fb39adf23a12102f2d950d5f07f0cd7e51e85ec327e07440a79c6  localedef-eglibc-2.14.1-r17443-ptx1.tar.bz2
-- 
2.4.10
