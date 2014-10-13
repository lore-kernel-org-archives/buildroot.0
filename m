From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 20:05:27 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mesa3d: Add hash file
In-Reply-To: <1413223527-8740-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413223527-8740-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413223527-8740-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated hash URL
 package/mesa3d/mesa3d.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mesa3d/mesa3d.hash

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
new file mode 100644
index 0000000..2695acb
--- /dev/null
+++ b/package/mesa3d/mesa3d.hash
@@ -0,0 +1,2 @@
+# From http://www.mesa3d.org/relnotes/10.3.1.html
+sha256	b081d077d717e5d56f2d59677490856052c41573e50378ff86d6c72456714add	MesaLib-10.3.1.tar.bz2
-- 
1.7.10.4
