From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 08:59:07 +0200
Subject: [Buildroot] [git commit] zsh: add hash for license file
Message-ID: <20170930065311.7B908810C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0343a4579645e550dda9714caa04cf1331b17de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zsh/zsh.hash b/package/zsh/zsh.hash
index 3155a5f..0770d8e 100644
--- a/package/zsh/zsh.hash
+++ b/package/zsh/zsh.hash
@@ -3,3 +3,5 @@ md5	dfe156fd69b0d8d1745ecf6d6e02e047	zsh-5.4.2.tar.gz
 # Calculated based on the hash above and after checking signature
 # http://www.zsh.org/pub/zsh-5.4.2.tar.gz.asc
 sha256	957bcdb2c57f64c02f673693ea5a7518ef24b6557aeb3a4ce222cefa6d74acc9	zsh-5.4.2.tar.gz
+# Locally calculated
+sha256	d06fdf3ef9b1ec69d6b9e170b0a9516fbad3523261ff1668bde3bfea6e0ef5f5  LICENCE
