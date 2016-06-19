From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 22:08:56 +0200
Subject: [Buildroot] [git commit] package/sqlcipher: add hash file
Message-ID: <20160619202358.49BCC81E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2face7a2bf3864dccc436afc765b961587fac39a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
new file mode 100644
index 0000000..f3c7e0b
--- /dev/null
+++ b/package/sqlcipher/sqlcipher.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  25fa4f4cb38dcf9e52e4d1f46be8fee9c7aaef35b6df96912a216b289e22c2af  sqlcipher-v3.2.0.tar.gz
