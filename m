From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 09:16:07 +0200
Subject: [Buildroot] [git commit] package/sane-backends: replace utf-8 space
 by ascii character
Message-ID: <20190508073739.9680D888A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02614478cc916efb499d9374022bf3e7f02f959d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sane-backends/sane-backends.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index ddf82500bb..09652c993f 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,5 +1,5 @@
 # From https://gitlab.com/sane-project/backends/tags/RELEASE_1_0_27
 sha256 293747bf37275c424ebb2c833f8588601a60b2f9653945d5a3194875355e36c9  sane-backends-1.0.27.tar.gz
 
-#??Hash for license file
+# Hash for license file
 sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
