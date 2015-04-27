From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:56 -0300
Subject: [Buildroot] [PATCH 05/16] lzip: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lzip/lzip.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lzip/lzip.hash

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
new file mode 100644
index 0000000..7b83e3e
--- /dev/null
+++ b/package/lzip/lzip.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7cd3fcda68fc9900efcf7784313e3bdd1303fef1a0546db9723f5e5564dd05b6	lzip-1.15.tar.gz
-- 
2.0.5
