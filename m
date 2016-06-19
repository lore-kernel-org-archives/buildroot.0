From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:50 +0200
Subject: [Buildroot] [PATCH 003/121] package/cosmo: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <f02f2905dc0fccb6533e4315ec2f46bf05e3a04c.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    cosmo-14.03.04-1.src.rock
---
 package/cosmo/cosmo.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/cosmo/cosmo.hash

diff --git a/package/cosmo/cosmo.hash b/package/cosmo/cosmo.hash
new file mode 100644
index 0000000..0be068c
--- /dev/null
+++ b/package/cosmo/cosmo.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  4e81c1bba7ab3b4633c8d6dadfc8332c59c818829436435b4d5a2ec76adfbb87  cosmo-14.03.04-1.src.rock
-- 
2.7.4
