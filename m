From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 23:22:16 +0200
Subject: [Buildroot] [git commit] libyaml: add hash for license file
Message-ID: <20180429212223.4E00080422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e933fa9801620e9b0c22b35880ab88ba98149cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
