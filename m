From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue, 24 Sep 2019 21:10:55 +0200
Subject: [Buildroot] [PATCH] wine: Add hashes for license files
Message-ID: <20190924191055.18037-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 385d146a24..4162ef97ac 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256 994050692f8417ee206daafa5fc0ff810cc9392ffda1786ac0f0fb0cf74dbd74 wine-4.0.2.tar.xz
+# Locally calculated
+sha256 e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c COPYING.LIB
+sha256 d29132813288a9b6034a79c53b22dbb1b078c70cec5c9bb731ae574cf812aa54 LICENSE
-- 
2.17.1
