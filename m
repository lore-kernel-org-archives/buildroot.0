From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 13 Mar 2015 00:08:53 +0100
Subject: [Buildroot] [PATCH] argp-standalone: Add hash file
Message-ID: <55021C85.9030500@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/argp-standalone/argp-standalone.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/argp-standalone/argp-standalone.hash

diff --git a/package/argp-standalone/argp-standalone.hash b/package/argp-standalone/argp-standalone.hash
new file mode 100644
index 0000000..5798214
--- /dev/null
+++ b/package/argp-standalone/argp-standalone.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be  argp-standalone-1.3.tar.gz
-- 
1.9.1
