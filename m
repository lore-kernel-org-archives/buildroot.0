From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 07:45:16 -0300
Subject: [Buildroot] [PATCH 07/10] libmnl: add hash file
In-Reply-To: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426675519-21481-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmnl/libmnl.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libmnl/libmnl.hash

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
new file mode 100644
index 0000000..c16dfe7
--- /dev/null
+++ b/package/libmnl/libmnl.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.3.tar.bz2.{md5sum,sha1sum}
+md5	7d95fc3bea3365bc03c48e484224f65f	libmnl-1.0.3.tar.bz2
+sha1	c27e25f67c6422ebf893fc3a844af8085a1c5b63	libmnl-1.0.3.tar.bz2
-- 
2.0.5
