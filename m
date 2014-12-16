From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 09:41:13 -0300
Subject: [Buildroot] [PATCH 2/2] apr-util: add hash file
In-Reply-To: <1418733673-12637-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418733673-12637-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1418733673-12637-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/apr-util/apr-util.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/apr-util/apr-util.hash

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
new file mode 100644
index 0000000..3db4396
--- /dev/null
+++ b/package/apr-util/apr-util.hash
@@ -0,0 +1,2 @@
+# From http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.gz.sha1
+sha1	72cc3ac693b52fb831063d5c0de18723bc8e0095	apr-util-1.5.4.tar.gz
-- 
2.0.4
