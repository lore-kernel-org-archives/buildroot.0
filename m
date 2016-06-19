From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:33 +0200
Subject: [Buildroot] [PATCH 046/121] package/python-pam: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <a68e986ee578e84097269edda0105e5c8ca69d12.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/python-pam/python-pam.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-pam/python-pam.hash

diff --git a/package/python-pam/python-pam.hash b/package/python-pam/python-pam.hash
new file mode 100644
index 0000000..90720dc
--- /dev/null
+++ b/package/python-pam/python-pam.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  796ac019b9ee805696d0d277d8fb912fa2391b6ac070dc6f9f1a9a0fadbc3a5a  PyPAM-0.5.0.tar.gz
-- 
2.7.4
