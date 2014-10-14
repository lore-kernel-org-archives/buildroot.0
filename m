From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:51 -0300
Subject: [Buildroot] [PATCH 14/16] eglibc/glibc: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/glibc.hash | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 package/glibc/glibc.hash

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
-- 
2.0.4
