From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 12 Mar 2015 21:07:16 +0100
Subject: [Buildroot] [PATCH] axel: Add hash file
Message-ID: <5501F1F4.5020705@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/axel/axel.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/axel/axel.hash

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
new file mode 100644
index 0000000..8957670
--- /dev/null
+++ b/package/axel/axel.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	359a57ab4e354bcb6075430d977c59d33eb3e2f1415a811948fa8ae657ca8036  axel-2.4.tar.gz
-- 
1.9.1
