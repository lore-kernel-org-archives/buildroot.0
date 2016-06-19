From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:56 +0200
Subject: [Buildroot] [PATCH 069/121] package/sysdig: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <6851ad35f20a94bb202a36be0639d6ebff3be45d.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sysdig/sysdig.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sysdig/sysdig.hash

diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
new file mode 100644
index 0000000..8b5766d
--- /dev/null
+++ b/package/sysdig/sysdig.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  e72490eaf413745aef87965a5abb1024908053064f86593b257f12bf5b0d6b97  sysdig-0.1.100.tar.gz
-- 
2.7.4
