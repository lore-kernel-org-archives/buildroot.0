From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 22:23:10 +0200
Subject: [Buildroot] [PATCH 1/1] libyaml: add hash for license file
Message-ID: <20180429202310.31437-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyaml/libyaml.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
index 44b04a3365..d4a0c335c3 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729  yaml-0.1.7.tar.gz
+sha256 d0d8b09800a45cd982e9568fc7669d9c1a4c330e275a821bbe24d54366d16fe9  LICENSE
-- 
2.14.1
