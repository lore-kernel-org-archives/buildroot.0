From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 25 May 2015 17:30:38 +0200
Subject: [Buildroot] [PATCH 5/5] pacakges/flite: add hash file
In-Reply-To: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432567838-2948-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/flite/flite.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/flite/flite.hash

diff --git a/package/flite/flite.hash b/package/flite/flite.hash
new file mode 100644
index 0000000..e4dd0c6
--- /dev/null
+++ b/package/flite/flite.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 45c662160aeca6560589f78daf42ab62c6111dd4d244afc28118c4e6f553cd0c flite-1.4-release.tar.bz2
-- 
2.4.1
