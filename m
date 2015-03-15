From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Mar 2015 13:52:46 +0100
Subject: [Buildroot] [PATCH] bonnie: Add hash file
Message-ID: <5505809E.4070404@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/bonnie/bonnie.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/bonnie/bonnie.hash

diff --git a/package/bonnie/bonnie.hash b/package/bonnie/bonnie.hash
new file mode 100644
index 0000000..acf00fd
--- /dev/null
+++ b/package/bonnie/bonnie.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb  bonnie++-1.03e.tgz
-- 
1.9.1
