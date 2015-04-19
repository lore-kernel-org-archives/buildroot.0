From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:19 +0200
Subject: [Buildroot] [PATCH 4/9] package/ed: add hash
In-Reply-To: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429448844-12598-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ed/ed.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ed/ed.hash

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
new file mode 100644
index 0000000..7871fb1
--- /dev/null
+++ b/package/ed/ed.hash
@@ -0,0 +1,2 @@
+# From http://lists.gnu.org/archive/html/bug-ed/2013-06/msg00001.html
+md5	565b6d1d5a9a8816b9b304fc4ed9405d	ed-1.9.tar.gz
-- 
1.7.10.4
