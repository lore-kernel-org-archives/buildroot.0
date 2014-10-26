From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 26 Oct 2014 10:04:30 -0300
Subject: [Buildroot] [PATCH 2/2] libmemcached: add hash file
In-Reply-To: <1414328670-29719-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414328670-29719-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414328670-29719-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmemcached/libmemcached.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libmemcached/libmemcached.hash

diff --git a/package/libmemcached/libmemcached.hash b/package/libmemcached/libmemcached.hash
new file mode 100644
index 0000000..85df58f
--- /dev/null
+++ b/package/libmemcached/libmemcached.hash
@@ -0,0 +1,2 @@
+# From https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz/+md5
+md5	b3958716b4e53ddc5992e6c49d97e819	libmemcached-1.0.18.tar.gz
-- 
2.0.4
