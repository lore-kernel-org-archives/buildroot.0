From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 07:45:18 -0300
Subject: [Buildroot] [PATCH 09/10] nfacct: add hash file
In-Reply-To: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426675519-21481-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426675519-21481-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nfacct/nfacct.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/nfacct/nfacct.hash

diff --git a/package/nfacct/nfacct.hash b/package/nfacct/nfacct.hash
new file mode 100644
index 0000000..48561ab
--- /dev/null
+++ b/package/nfacct/nfacct.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.1.tar.bz2.{md5sum,sha1sum}
+md5	992e863409d144350dbc8f0554a0f478	nfacct-1.0.1.tar.bz2
+sha1	57c5fa68a172b30b6c5ea6cb36be685e207312ef	nfacct-1.0.1.tar.bz2
-- 
2.0.5
