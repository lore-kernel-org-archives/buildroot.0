From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 23:30:27 +0200
Subject: [Buildroot] [PATCH v1 25/28] package/sane-backends: replace utf-8
 space by ascii character
In-Reply-To: <20190507213030.1542-1-ps.report@gmx.net>
References: <20190507213030.1542-1-ps.report@gmx.net>
Message-ID: <20190507213030.1542-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/sane-backends/sane-backends.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index ddf82500bb..09652c993f 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,5 +1,5 @@
 # From https://gitlab.com/sane-project/backends/tags/RELEASE_1_0_27
 sha256 293747bf37275c424ebb2c833f8588601a60b2f9653945d5a3194875355e36c9  sane-backends-1.0.27.tar.gz

-#?Hash for license file
+# Hash for license file
 sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
--
2.21.0
