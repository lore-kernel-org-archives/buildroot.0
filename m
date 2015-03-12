From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 12 Mar 2015 21:07:47 +0100
Subject: [Buildroot] [PATCH] avrdude: Add hash file
Message-ID: <5501F213.2060506@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/avrdude/avrdude.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/avrdude/avrdude.hash

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
new file mode 100644
index 0000000..5b294d5
--- /dev/null
+++ b/package/avrdude/avrdude.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	dff1ca73f115db67e8650dbe87b9ac05a2c51ac528ca1bb04726263aeff84ec7  avrdude-eabe067c4527bc2eedc5db9288ef5cf1818ec720.tar.gz
-- 
1.9.1
