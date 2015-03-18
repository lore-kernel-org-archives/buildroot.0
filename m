From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 07:45:13 -0300
Subject: [Buildroot] [PATCH 04/10] libnetfilter_log: add hash file
In-Reply-To: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426675519-21481-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnetfilter_log/libnetfilter_log.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libnetfilter_log/libnetfilter_log.hash

diff --git a/package/libnetfilter_log/libnetfilter_log.hash b/package/libnetfilter_log/libnetfilter_log.hash
new file mode 100644
index 0000000..4fe6a9b
--- /dev/null
+++ b/package/libnetfilter_log/libnetfilter_log.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/libnetfilter_log/libnetfilter_log-1.0.1.tar.bz2.{md5sum,sha1sum}
+md5	2a4bb0654ae675a52d2e8d1c06090b94	libnetfilter_log-1.0.1.tar.bz2
+sha1	0b95bcb1ad15eea906fa3607cd6c2290bd48d5bd	libnetfilter_log-1.0.1.tar.bz2
-- 
2.0.5
