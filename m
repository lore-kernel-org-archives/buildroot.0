From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Jul 2015 09:52:32 -0300
Subject: [Buildroot] [PATCH 4/4] popt: add hash file
In-Reply-To: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436273552-2877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436273552-2877-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/popt/popt.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/popt/popt.hash

diff --git a/package/popt/popt.hash b/package/popt/popt.hash
new file mode 100644
index 0000000..4d93e47
--- /dev/null
+++ b/package/popt/popt.hash
@@ -0,0 +1,2 @@
+# Locally calculated based on http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/popt-1.16.tar.gz.md5sum
+sha256	e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8	popt-1.16.tar.gz
-- 
2.3.6
