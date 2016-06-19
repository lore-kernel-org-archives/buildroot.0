From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:10:00 +0200
Subject: [Buildroot] [PATCH 073/121] package/ti-utils: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <3cc9b696d53b98df97e6e1ed67eb8c0b57138e7b.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    ti-utils-06dbdb2727354b5f3ad7c723897f40051fddee49.tar.gz
---
 package/ti-utils/ti-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ti-utils/ti-utils.hash

diff --git a/package/ti-utils/ti-utils.hash b/package/ti-utils/ti-utils.hash
new file mode 100644
index 0000000..e1de8cc
--- /dev/null
+++ b/package/ti-utils/ti-utils.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  d05d4e3ad3599fca7854109938aebd24bbab72ac7d69dd053260f735a36613f9  ti-utils-06dbdb2727354b5f3ad7c723897f40051fddee49.tar.gz
-- 
2.7.4
