From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:29:12 -0300
Subject: [Buildroot] [PATCH 3/6] ipsec-tools: add hash file
In-Reply-To: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426688955-23233-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipsec-tools/ipsec-tools.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/ipsec-tools/ipsec-tools.hash

diff --git a/package/ipsec-tools/ipsec-tools.hash b/package/ipsec-tools/ipsec-tools.hash
new file mode 100644
index 0000000..b12bea9
--- /dev/null
+++ b/package/ipsec-tools/ipsec-tools.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/0.8.2/
+md5	d53ec14a0a3ece64e09e5e34b3350b41	ipsec-tools-0.8.2.tar.bz2
+sha1	7d92cae9fde59fb4f125636698c43b0a3df3d0f0	ipsec-tools-0.8.2.tar.bz2
-- 
2.0.5
