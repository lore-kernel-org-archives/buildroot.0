From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:29:11 -0300
Subject: [Buildroot] [PATCH 2/6] haveged: add hash file
In-Reply-To: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426688955-23233-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/haveged/haveged.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/haveged/haveged.hash

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
new file mode 100644
index 0000000..d1133b6
--- /dev/null
+++ b/package/haveged/haveged.hash
@@ -0,0 +1,2 @@
+# From http://www.issihosts.com/haveged/verify/haveged-1.9.1.sha1
+sha1	ab7234b7f57dbb7d500a5ab3cbf0494715ce6499	haveged-1.9.1.tar.gz
-- 
2.0.5
