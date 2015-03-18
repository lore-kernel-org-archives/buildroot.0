From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 07:45:14 -0300
Subject: [Buildroot] [PATCH 05/10] libnetfilter_queue: add hash file
In-Reply-To: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426675519-21481-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_queue/libnetfilter_queue.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libnetfilter_queue/libnetfilter_queue.hash

diff --git a/package/libnetfilter_queue/libnetfilter_queue.hash b/package/libnetfilter_queue/libnetfilter_queue.hash
new file mode 100644
index 0000000..4ea3721
--- /dev/null
+++ b/package/libnetfilter_queue/libnetfilter_queue.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/libnetfilter_queue/libnetfilter_queue-1.0.2.tar.bz2.{md5sum,sha1sum}
+md5	df09befac35cb215865b39a36c96a3fa	libnetfilter_queue-1.0.2.tar.bz2
+sha1	8cc0b8ed33162281bc9fa8bcfa8c9dcb08848ff9	libnetfilter_queue-1.0.2.tar.bz2
-- 
2.0.5
