From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:03:05 -0300
Subject: [Buildroot] [PATCH 14/16] sed: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sed/sed.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sed/sed.hash

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
new file mode 100644
index 0000000..e7f2db5
--- /dev/null
+++ b/package/sed/sed.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff	sed-4.2.2.tar.gz
-- 
2.0.5
