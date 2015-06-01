From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Jun 2015 21:36:27 +0300
Subject: [Buildroot] [PATCH] grantlee: add hash
Message-ID: <999e94397b943819ace3371c68845fe2e49a3cc4.1433183787.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/grantlee/grantlee.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/grantlee/grantlee.hash

diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
new file mode 100644
index 000000000000..7f02bb3274b6
--- /dev/null
+++ b/package/grantlee/grantlee.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+sha256	191809bf4c9b7ef877af0fd29345061c2372edfb4506aa7d5df5c71a570fa0ac	grantlee-0.5.1.tar.gz
+sha256	eaf22ba92e53b8eb5dd8bca045fe81b734d3445445ed9e0c1af2a0a7c375b161	grantlee-5.0.0.tar.gz
-- 
2.1.4
