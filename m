From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 12 Mar 2015 21:07:14 +0100
Subject: [Buildroot] [PATCH] aumix: Add hash file
Message-ID: <5501F1F2.7090909@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/aumix/aumix.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/aumix/aumix.hash

diff --git a/package/aumix/aumix.hash b/package/aumix/aumix.hash
new file mode 100644
index 0000000..dbcd1e5
--- /dev/null
+++ b/package/aumix/aumix.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	636eef7f400c2f3df489c0d2fa21507e88692113561e75a40a26c52bc422d7fc  aumix-2.8.tar.bz2
-- 
1.9.1
