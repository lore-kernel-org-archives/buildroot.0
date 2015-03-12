From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 12 Mar 2015 21:07:52 +0100
Subject: [Buildroot] [PATCH] autoconf: Add hash file
Message-ID: <5501F218.3060805@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/autoconf/autoconf.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/autoconf/autoconf.hash

diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
new file mode 100644
index 0000000..f35f6f8
--- /dev/null
+++ b/package/autoconf/autoconf.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684  autoconf-2.69.tar.xz
-- 
1.9.1
