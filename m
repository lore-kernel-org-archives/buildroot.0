From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:25:25 +0200
Subject: [Buildroot] [git commit] eglibc/glibc: add hash file
Message-ID: <20141022202536.B2535B02B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8117608a3f6f8fc7c3ce9124ecf20c0e14ddefeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.hash |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
new file mode 100644
index 0000000..094bbda
--- /dev/null
+++ b/package/glibc/glibc.hash
@@ -0,0 +1,8 @@
+# Locally calculated after checking pgp signature (glibc)
+# http://downloads.yoctoproject.org/releases/eglibc/*.{md5,sha1} (eglibc)
+md5	b395b021422a027d89884992e91734fc	eglibc-2.18-svnr23787.tar.bz2
+sha1	224d9e655e8f0ad04ffde47b97a11c64e2255b56	eglibc-2.18-svnr23787.tar.bz2
+md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
+sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
+sha256	2d3997f588401ea095a0b27227b1d50cdfdd416236f6567b564549d3b46ea2a2	glibc-2.19.tar.xz
+sha256	f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5	glibc-2.20.tar.xz
