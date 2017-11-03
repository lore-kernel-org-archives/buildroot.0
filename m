From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:57 +0100
Subject: [Buildroot] [PATCH 22/31] package/openobex: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-23-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/openobex/openobex.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openobex/openobex.hash b/package/openobex/openobex.hash
index dbff4f1c1f..2911e375e0 100644
--- a/package/openobex/openobex.hash
+++ b/package/openobex/openobex.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/openobex/files/openobex/1.7.2/
 sha1 4a5098a62889134cbd2b54997e7ff3e959e601e6  openobex-1.7.2-Source.tar.gz
 md5 f6e0b6cb7dcfd731460a7e9a91429a3a  openobex-1.7.2-Source.tar.gz
+# Locally computed
+sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
+sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
-- 
2.15.0
