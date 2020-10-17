From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 20:16:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/mksh: fix legal-info
Message-ID: <20201017181628.3462312-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b6b5981f704ff1196f44835c18c245d5e964b2ab forgot to update hash
of mksh.1 which is used as the license file

Fixes:
 - http://autobuild.buildroot.org/results/1291917e4b17e087455a6698c4b82e4ff783600d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mksh/mksh.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 61a3acdc12..7fc34fa3e3 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
 sha256  907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6  mksh-R59b.tgz
 # Locally computed
-sha256  4655d87a53a703ead36a52f166f065c23cf58dd02d7b14abd2474f9f49383a16  mksh.1
+sha256  fb1e64c95ded58058c7f0cf5269236bc83c3cbda089cbb025b03e08f189bf47e  mksh.1
-- 
2.28.0
