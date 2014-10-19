From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 19:25:21 +0200
Subject: [Buildroot] [git commit] gmp: add hash file
Message-ID: <20141019172550.A0FBFAFD61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d6504823d04871f6e6a02c62024b153e607abb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmp/gmp.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
new file mode 100644
index 0000000..9fe6344
--- /dev/null
+++ b/package/gmp/gmp.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9156d32edac6955bc53b0218f5f3763facb890b73a835d5e1b901dcf8eb8b764	gmp-6.0.0a.tar.xz
