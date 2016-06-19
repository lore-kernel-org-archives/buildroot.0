From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:28:25 +0200
Subject: [Buildroot] [git commit] package/ipkg: add hash file
Message-ID: <20160619194718.7F60B81DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2f400b33e5cb91becd1984b4e54660afe04b785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipkg/ipkg.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ipkg/ipkg.hash b/package/ipkg/ipkg.hash
new file mode 100644
index 0000000..34a2d62
--- /dev/null
+++ b/package/ipkg/ipkg.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  405743e1ba320ed6095d42a898f1486e3af1d745cae2bd45dfe1d8403a4d8995  ipkg-0.99.163.tar.gz
