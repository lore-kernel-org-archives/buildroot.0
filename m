From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 21 Apr 2015 04:38:56 +0200
Subject: [Buildroot] [PATCH 3/3] package/clapack: add hash
In-Reply-To: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
References: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1429583936-13335-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/clapack/clapack.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/clapack/clapack.hash

diff --git a/package/clapack/clapack.hash b/package/clapack/clapack.hash
new file mode 100644
index 0000000..08657fc
--- /dev/null
+++ b/package/clapack/clapack.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0b3f782bc24845d85f36bafbff0f2f1384dc72df730fda4e7924ec1a70baca5a clapack-3.2.1-CMAKE.tgz
-- 
2.3.5
