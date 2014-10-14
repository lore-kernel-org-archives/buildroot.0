From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:42 -0300
Subject: [Buildroot] [PATCH 05/16] libidn: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libidn/libidn.hash

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
new file mode 100644
index 0000000..f486626
--- /dev/null
+++ b/package/libidn/libidn.hash
@@ -0,0 +1,2 @@
+# From https://lists.gnu.org/archive/html/info-gnu/2014-08/msg00006.html
+sha256	fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c	libidn-1.29.tar.gz
-- 
2.0.4
