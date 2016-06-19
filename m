From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:28 +0200
Subject: [Buildroot] [PATCH 041/121] package/python-keyring: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <34fadc1b33b88c08b05c154e08092e72a1bbd079.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/python-keyring/python-keyring.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-keyring/python-keyring.hash

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
new file mode 100644
index 0000000..83be118
--- /dev/null
+++ b/package/python-keyring/python-keyring.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  c3f0665ee2d969170dcd6b9e83e76cc7fca2be5a40943700ce2624a0a02f9658  keyring-3.0.5.zip
-- 
2.7.4
