From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:18:16 +0200
Subject: [Buildroot] [git commit] guile: add hash file
Message-ID: <20150427211958.8C0DC7FD20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff2cc02500f31afe962b0f50a7eb4df8101f1241
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/guile/guile.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
new file mode 100644
index 0000000..9ba0bf5
--- /dev/null
+++ b/package/guile/guile.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2	guile-2.0.11.tar.xz
